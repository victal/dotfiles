#!/usr/bin/env bash

PY_VERSION="$1"
VENV_NAME="$2"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install -s "$PY_VERSION" >&2 
pyenv virtualenv-delete -f "${VENV_NAME}" >&2
pyenv virtualenv "$PY_VERSION" "${VENV_NAME}" >&2
pyenv activate "${VENV_NAME}" >&2
pip install pynvim neovim msgpack >&2
pyenv which python
