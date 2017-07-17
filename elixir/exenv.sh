#!/usr/bin/env bash
if [ -d ~/.exenv ]; then
  echo '########## exenv already installed, skipping.'
else
  echo " ==> installing dependencies ..."
  sudo apt-get install -y --force-yes erlang erlang-doc > /dev/null
  echo " ==> installing exenv ..."
  git clone https://github.com/mururu/exenv.git ~/.exenv > /dev/null
  mkdir -p ~/.exenv/plugins
  echo " ==> installing elixir-build ..."
  git clone https://github.com/mururu/elixir-build.git ~/.exenv/plugins/elixir-build > /dev/null
fi
