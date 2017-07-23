#!/usr/bin/env bash
# exenv
export RBENV_ROOT="/usr/local/rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
which exenv > /dev/null && eval "$(rbenv init -)"