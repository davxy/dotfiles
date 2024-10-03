# https://lldb.llvm.org/python_api.htmho
# https://lldb.llvm.org/python_api/lldb.SBFrame.html

import lldb
import os

def short_backtrace(debugger, command, result, internal_dict):
    """Short Backtrace
    Faster and less invasive backtrace
    """

    target = lldb.debugger.GetSelectedTarget()
    thread = target.GetProcess().GetSelectedThread()

    cwd = os.getcwd()
    cwdlen = len(cwd)

    if len(command) == 0:
        max_level = 1
    else:
        max_level = int(command)

    selected_frame = thread.GetSelectedFrame()
    frame = thread.GetFrameAtIndex(0)
    level = 0
    while frame is not None:
        if level >= max_level or frame.name is None:
            break

        if frame == selected_frame:
            out = '▶'
        else:
            out = ' '

        out += '{:2} {}'.format(frame.idx, frame.name)
        outlen = len(out)
        if outlen > 150:
            out = out[:50] + '...' + out[outlen-100:]


        print("%s" % out)

        lentry = frame.line_entry
        if lentry.file.fullpath is not None:
            path = lentry.file.fullpath + ":" + str(lentry.line)
            if lentry.file.exists == True:
                if (path[:cwdlen] == cwd):
                    path = '.' + path[cwdlen:]
            else:
                path = "(" + path + ")"
            # Experimental: extract func name from the mangled namespaced string
            # This assumes that the function name has an alphanumeric trailer.
            off1 = out.rfind("::")
            off2 = out.rfind("::",0, off1) + 2
            func_name = out[off2:off1]
            print('     ↳ {} @ {}'.format(func_name, path))
        print('')
        level += 1
        frame = frame.parent

def __lldb_init_module(debugger, internal_dict):
    """required function to import module to lldb"""
    debugger.HandleCommand('command script add -f sbt.short_backtrace sbt')
