#!/bin/python3
#
# Simple script to focus one opened window in Sway using 'rofi' or 'dmenu'
#
# Data tree returned by `swaymsg -t get_tree`
#
#   .
#   + nodes (<<< OUTPUT, e.g. monitor)
#       + name: "DP-1"
#       + nodes (<<< WORKSPACE)
#           + name: "1"
#           + nodes (<<< WINDOWS)
#           + floating_nodes (<<< FLOATING-WINDOWS)
#
# Notes:
# - OUTPUT first node (index 0) contains scratchpad

import json
import subprocess
import re
import os

def proc_name_by_pid(pid):
    pid_path = "/proc/{}/comm".format(pid)
    name = "???"
    if os.path.exists(pid_path):
        with open(pid_path) as f:
            name = f.read().rstrip('\n')
    return name

# Process a single window
def process_window(window, workspace):
    print(window)
    focused = "  "
    if window["focused"]:
        focused = " *"
    if workspace == "__i3_scratch":
        workspace = "S"
    name = proc_name_by_pid(window["pid"]).ljust(20)
    ids = "{}{} ({})".format(focused, workspace, window["id"]).ljust(10)
    return "{} | {} | {}".format(ids, name, window["name"])

# Recursively process a windows set
def process_windows(windows, workspace):
    ret = []
    for window in windows:
        sub_wins = window["nodes"]
        if len(sub_wins) == 0:
            desc = process_window(window, workspace)
            ret.append(desc)
        else:
            ret += process_windows(sub_wins, workspace)
    return ret

# Collect windows from sway, both normal and floating
def lookup_windows():
    windows = []
    command="swaymsg -t get_tree"
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    data = json.loads(process.communicate()[0])
    outputs=data["nodes"]
    for output in outputs:
        workspaces = output["nodes"]
        for workspace in workspaces:
            workspace_name = workspace["name"]
            windows += process_windows(workspace["nodes"], workspace_name)
            windows += process_windows(workspace["floating_nodes"], workspace_name)
    return windows

# Show a selection menu using rofi and return the selected window id
def show_menu(windows):
    # Returns a newline seperated UFT-8 encoded string of all windows for wofi
    command="rofi -dmenu -i -p 'Running applications'"
    enter="\n"
    input=enter.join(windows).encode("UTF-8")
    process = subprocess.Popen(command, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    selected = process.communicate(input)[0]
    selected = str(selected, 'UTF-8')
    return re.search('\(([0-9]+)\)', selected).group(1)

# Switch focus to the selected window
def focus_window(selection):
    command="swaymsg [con_id=\"{}\"] focus".format(id)
    subprocess.Popen(command, shell=True)

# Entry point
if __name__ == "__main__":
    windows = lookup_windows()
    id = show_menu(windows)
    focus_window(id)
