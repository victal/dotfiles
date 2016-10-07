#!/bin/bash

# Install needed dependencies
apt install aptitude ansible
ansible-playbook -K $1
