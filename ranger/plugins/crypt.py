import os
import tarfile
from gnupg import GPG
from ranger.api.commands import Command
from subprocess import run
import subprocess


def get_passphrase(cmd, prompt):
    program = "from getpass import getpass; print(getpass('{}: '));".format(prompt)
    command = 'python -c "{}"'.format(program)
    psw = cmd.fm.execute_command(command, stdout=subprocess.PIPE)
    stdout, _ = psw.communicate()
    if psw.returncode != 0:
        return None
    pwd = stdout.strip().decode('utf-8')
    if pwd == "":
        return None
    return pwd


class encrypt(Command):
    """:encrypt

    Encrypts a file or directory using gpg
    """

    def tardir(self, path):
        """
        tars a directory into a dir of the same name appended with .tar.gz

        returns the name of the tarfile
        """
        output_path = path + '.tar.gz'

        with tarfile.open(output_path, "w:gz") as tar_handle:
            for root, dirs, files in os.walk(path):
                for file in files:
                    tar_handle.add(os.path.join(root, file))

        return output_path

    def execute(self):
        gpg = GPG()
        recipient = None
        pwd = get_passphrase(self, "password")
        con = get_passphrase(self, "confirm")
        if pwd is None or con is None:
            self.fm.notify('Unable to read passphrase', bad=True)
            return
        if pwd != con:
            self.fm.notify("Confirmation doesn't match", bad=True)
            return

        paths = [os.path.basename(f.path)
                 for f in self.fm.thistab.get_selection()]

        for p in paths:
            if os.path.isdir(p):
                new_p = self.tardir(p)
                run(['rm', '-rf', p])
                p = new_p

            with open(p, 'rb') as f:
                enc = gpg.encrypt_file(f, recipient,
                                       symmetric=True, passphrase=pwd)

            with open(p + '.gpg', 'wb+') as out:
                out.write(enc.data)

            if os.path.isfile(p):
                os.remove(p)


class decrypt(Command):
    """:decrypts

    Decrypts a file or a directory with gpg
    """

    def execute(self):
        gpg = GPG()
        passphrase = get_passphrase(self, "password")
        if passphrase is None:
            self.fm.notify('Unable to read passphrase', bad=True)
            return

        paths = [os.path.basename(f.path)
                 for f in self.fm.thistab.get_selection()]

        for p in [p for p in paths if p.endswith('gpg')]:
            with open(p, 'rb') as enc:
                dec_res = gpg.decrypt_file(enc, passphrase=passphrase)
                if dec_res.ok is False:
                    self.fm.notify('Decryption failure', bad=True)
                    return

            filename = os.path.splitext(p)[0]
            with open(filename, 'wb+') as file:
                file.write(dec_res.data)
            os.remove(p)
            if tarfile.is_tarfile(filename):
                tarfile.open(filename).extractall(path='.')
                os.remove(filename)
