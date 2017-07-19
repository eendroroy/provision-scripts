#!/usr/bin/env bash
# exenv
export EXENV_ROOT="/usr/local/exenv"
export PATH="$EXENV_ROOT/bin:$PATH"
which exenv > /dev/null && eval "$(exenv init -)"