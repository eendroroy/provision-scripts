#!/usr/bin/env bash
GOENV_PATH="/usr/local/goenv"
GOENV_PATH_TMP="/tmp/goenv"
if [ -d ${GOENV_PATH} ]; then
  echo '########## goenv already installed, skipping.'
else
  echo " ==> installing goenv ..."
  git clone https://github.com/syndbg/goenv.git ${GOENV_PATH_TMP}
	sudo mv ${GOENV_PATH_TMP} ${GOENV_PATH}
	sudo chown ${USER}:${USER} ${GOENV_PATH} -R
	echo " ==> updating path"
	sudo cp "${0:A:h}/goenv.template.sh" /etc/profile.d/goenv.sh
fi
