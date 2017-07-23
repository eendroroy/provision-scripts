#!/usr/bin/env bash
SCRIPT_ROOT=$(dirname $(readlink -f $0))
GOENV_PATH="/usr/local/goenv"
GOENV_PATH_TMP="/tmp/goenv"
if [ -d ${GOENV_PATH} ]; then
  echo '########## goenv already installed, skipping.'
else
  echo " ==> installing goenv ..."
  git clone https://github.com/syndbg/goenv.git ${GOENV_PATH_TMP} > /dev/null
	sudo mv ${GOENV_PATH_TMP} ${GOENV_PATH} > /dev/null
	sudo chown ${USER}:${USER} ${GOENV_PATH} -R > /dev/null
	echo " ==> updating path"
	sudo cp "${SCRIPT_ROOT}/goenv.template.sh" /etc/profile.d/goenv.sh > /dev/null
fi
