from ranger.api.commands import Command
from ranger.ext.get_executables import get_executables

import subprocess
import os

class rf(Command):
    """
    :rf
    Search into files using fzf and rg.
    """

    def execute(self):
        if 'fzf' not in get_executables():
            self.fm.notify('Could not find fzf in the PATH.', bad=True)
            return

        if 'rg' not in get_executables():
            self.fm.notify('Could not find rg in the PATH.', bad=True)
            return

        env = os.environ.copy()

        rg_cmd = "rg . --line-number --column --no-heading --glob '!.git'"

        preview_cmd = "bat --style=full --color=always --highlight-line {2} {1}"
        preview_win = "up,~4,+{2}+4/2"

        fzf_cmd = "fzf --no-multi --no-sort --tac --exact --delimiter : --nth 4.. --preview '{}' --preview-window '{}'".format(preview_cmd, preview_win)

        cmd = "{} | {}".format(rg_cmd, fzf_cmd)

        fzf = self.fm.execute_command(cmd, env=env,
                                      universal_newlines=True,
                                      stdout=subprocess.PIPE)
        if fzf.returncode != 0:
            self.fm.notify('Could not execute fzf', bad=True)
            return
        stdout, _ = fzf.communicate()

        selected = os.path.abspath(stdout.strip())
        selected = ':'.join(selected.split(':', 3)[:3])

        cmd = "$EDITOR {}".format(selected)
        self.fm.execute_command(cmd, env=env,
                                      universal_newlines=True)
