#!/usr/bin/env python
# encoding: utf-8

import json
import subprocess
import os
import sys
from tempfile import TemporaryFile
# Extracted from the workspace controller in https://github.com/benkaiser/i3-wm-config/


def get_workspace():
    handle = subprocess.Popen(["i3-msg", "-t", "get_workspaces"], stdout=subprocess.PIPE)
    output = handle.communicate()[0]
    data = json.loads(output.decode())
    data = sorted(data, key=lambda k: k['name'])
    for i in data:
        if i['focused']:
            return i['name']


def dmenu_fetch(inputstr):
    t = TemporaryFile()
    t.write(bytes(inputstr, 'UTF-8'))
    t.seek(0)
    dmenu_run = subprocess.Popen(["dmenu"], stdout=subprocess.PIPE, stdin=t)
    output = (dmenu_run.communicate()[0]).decode().strip()
    return output


def open_app(workspace):
    home = os.path.expanduser("~")
    cache = home+"/.cache/dmenu_run"
    check_new_programs(home, cache)
    applications = open(cache)
    dmenu_run = subprocess.Popen(["dmenu"], stdout=subprocess.PIPE,
                                 stdin=applications)
    output = (dmenu_run.communicate()[0]).decode().strip()
    if output:
        run_app(workspace, output)

def run_app(workspace, app):
    subprocess.Popen(["i3-msg", "workspace "+workspace+"; exec " + app], stdout=subprocess.PIPE)


def check_new_programs(home, cachefile):
    check = subprocess.Popen([home + "/.i3/dmenu_update"], 
                             stdout=subprocess.PIPE)
    check.communicate()


def main():
    workspace = get_workspace()
    if len(sys.argv) > 1:
        app_name = sys.argv[1]
        run_app(workspace, app_name)
    else:
        open_app(workspace)

if __name__ == '__main__':
    main()
