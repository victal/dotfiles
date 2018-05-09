#!/bin/bash
if type jira > /dev/null 2>&1;
then
    eval "$(jira --completion-script-bash)"
fi
