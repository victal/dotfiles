VENVWRAPPER_PATH=$(which virtualenvwrapper_lazy.sh)
if [ $? = 0 ]
then
    export WORKON_HOME=$HOME/venv
    source $VENVWRAPPER_PATH
fi
export PYTHONSTARTUP=$HOME/.pyrc.py

#Pipenv shell completion
#if command -v pipenv 1>/dev/null 2>&1; then  
    #eval "$(pipenv --completion)"
#fi
