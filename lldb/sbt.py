# https://lldb.llvm.org/python_api.html
# https://lldb.llvm.org/python_api/lldb.SBFrame.html

import lldb

def short_backtrace(debugger, command, result, internal_dict):
    """Short Backtrace
    Faster and less invasive backtrace
    """

    target = lldb.debugger.GetSelectedTarget()
    thread = target.GetProcess().GetSelectedThread()
    print(thread)

    if len(command) == 0:
        return
    max_level = int(command)

    selected_frame = thread.GetSelectedFrame()

    level = 0
    for frame in thread.frames:
        if level >= max_level:
            break

        if frame == selected_frame:
            out = '▶'
        else:
            out = ' '
        out += '{} {}'.format(frame.idx, frame.name)
        outlen = len(out)
        if outlen > 150:
            out = out[:50] + '...' + out[outlen-100:]
        print("%s" % out)

        print('       {}'.format(frame.line_entry))

        level += 1

def __lldb_init_module(debugger, internal_dict):
    """required function to import module to lldb"""
    debugger.HandleCommand('command script add -f lldb_sbt.short_backtrace sbt')
