# Update last visited folder

import ranger.api

hook_init_prev = ranger.api.hook_init

def hook_init(fm):
    def update_last_dir(signal):
        file = open("/tmp/last_dir", "w")
        file.write("{}\n".format(signal.new.path))
        file.close()

    fm.signal_bind("cd", update_last_dir)
    return hook_init_prev(fm)

ranger.api.hook_init = hook_init
