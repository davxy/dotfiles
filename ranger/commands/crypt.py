from ranger.api.commands import Command
from ranger.core.loader import CommandLoader
import os

class encrypt(Command):
    """
    :encrypt
    Encrypts a folder or a file using gpg symmetric encryption.
    Folders are first archived using tar.
    """
    
    def execute(self):
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()
        if not marked_files:
            return
        
        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        
        descr = "encrypting files in: " + os.path.basename(parts[1])

        obj = CommandLoader(args=['gpg --encrypt'] + \
            [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr, read=True)        
        
        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)