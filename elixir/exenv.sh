#!/usr/bin/env bash
EXENV_PATH="/usr/local/exenv"
EXENV_PATH_TMP="/tmp/exenv"
if [ -d ${EXENV_PATH} ]; then
  echo '########## exenv already installed, skipping.'
else
  echo " ==> installing dependencies ..."
  sudo apt-get install -y --force-yes erlang erlang-doc > /dev/null
  echo " ==> installing exenv ..."
  git clone https://github.com/mururu/exenv.git ${EXENV_PATH_TMP} > /dev/null
  mkdir -p ${EXENV_PATH_TMP}/plugins
  echo " ==> installing elixir-build ..."
  git clone https://github.com/mururu/elixir-build.git ${EXENV_PATH_TMP}/plugins/elixir-build > /dev/null
	sudo mv ${EXENV_PATH_TMP} ${EXENV_PATH}
	sudo chown ${USER}:${USER} ${EXENV_PATH} -R
	echo " ==> updating path"
	sudo cp "${0:A:h}/exenv.template.sh" /etc/profile.d/exenv.sh
fi
