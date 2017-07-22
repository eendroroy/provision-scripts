#!/usr/bin/env bash
# exenv
export GOENV_ROOT="/usr/local/goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
which exenv > /dev/null && eval "$(goenv init -)"