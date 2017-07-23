#!/usr/bin/env bash
# exenv
export PYENV_ROOT="/usr/local/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
which nodenv > /dev/null && eval "$(pyenv init -)"