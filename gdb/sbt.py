# https://sourceware.org/gdb/current/onlinedocs/gdb/Frames-In-Python.html

class ShortBacktrace(gdb.Command):
    # Object initialization
    def __init__(self):
        super(self.__class__, self).__init__('sbt', gdb.COMMAND_FILES)

    # Object invocation
    def invoke(self, argument, from_tty):
        frame = gdb.newest_frame()
        level = 0
        max_level = int(argument)
        while frame is not None:
            # Check level
            if level >= max_level:
                break
            # Print information
            sal = frame.find_sal()
            if frame == gdb.selected_frame():
                out = '>'
            else:
                out = ' '
            out += '{} - {}'.format(level, frame.name()) # alt function()
            out = (out[:80] + '...') if len(out) > 80 else out
            out += ' at {}:{}\n'.format(sal.symtab.filename, sal.line)
            gdb.write(out)
            # Grab previous frame information
            frame = frame.older()
            level += 1

ShortBacktrace()
