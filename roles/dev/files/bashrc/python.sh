VENVWRAPPER_PATH=$(which virtualenvwrapper_lazy.sh)
if [ $? = 0 ]
then
    export WORKON_HOME=$HOME/venv
    source $VENVWRAPPER_PATH
fi
export PYTHONSTARTUP=$HOME/.pyrc.py
