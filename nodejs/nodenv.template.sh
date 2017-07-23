#!/usr/bin/env bash
# exenv
export NODENV_ROOT="/usr/local/nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
which nodenv > /dev/null && eval "$(nodenv init -)"