#!/usr/bin/env bash
SCRIPT_ROOT=$(dirname $(readlink -f $0))
EXENV_PATH="/usr/local/exenv"
EXENV_PATH_TMP="/tmp/exenv"
if [ -d ${EXENV_PATH} ]; then
  echo '########## exenv already installed, skipping.'
else
  echo " ==> installing dependencies ..."
  sudo apt-get install -y --force-yes erlang erlang-doc > /dev/null
  echo " ==> installing exenv ..."
  git clone https://github.com/mururu/exenv.git ${EXENV_PATH_TMP} > /dev/null
  mkdir -p ${EXENV_PATH_TMP}/plugins > /dev/null
  echo " ==> installing elixir-build ..."
  git clone https://github.com/mururu/elixir-build.git ${EXENV_PATH_TMP}/plugins/elixir-build > /dev/null
	sudo mv ${EXENV_PATH_TMP} ${EXENV_PATH} > /dev/null
	sudo chown ${USER}:${USER} ${EXENV_PATH} -R > /dev/null
	echo " ==> updating path"
	sudo cp "${SCRIPT_ROOT}/exenv.template.sh" /etc/profile.d/exenv.sh > /dev/null
fi
