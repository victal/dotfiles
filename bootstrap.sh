#!/bin/bash

# Install needed dependencies
apt install aptitude python-pip
pip install --user github3.py==1.0.0a4 ansible
ansible-playbook -K "$1"
