#!/bin/bash

# Install needed dependencies
apt install aptitude python-pip
pip install --user ansible
ansible-playbook -K $1
