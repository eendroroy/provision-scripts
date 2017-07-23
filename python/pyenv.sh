#!/usr/bin/env bash
PYENV_PATH="/usr/local/pyenv"
PYENV_PATH_TMP="/tmp/pyenv"
if [ -d ${PYENV_PATH} ]; then
  echo '########## pyenv already installed, skipping.'
else
  echo " ==> installing dependencies ..."
  sudo apt-get install -y --force-yes libssl-dev libreadline-dev zlib1g-dev git
  sudo apt-get install -y --force-yes build-essential checkinstall
  sudo apt-get install -y --force-yes libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
  echo " ==> installing pyenv ..."
  git clone https://github.com/pyenv/pyenv.git ${PYENV_PATH_TMP}
  mkdir -p ${PYENV_PATH_TMP}/plugins
  pushd ${PYENV_PATH_TMP}/plugins
  echo " ==> installing pyenv-cache ..."
  git clone https://github.com/pyenv/pyenv-ccache.git
  echo " ==> installing pyenv-version-ext ..."
  git clone https://github.com/pyenv/pyenv-version-ext.git
	sudo mv ${PYENV_PATH_TMP} ${PYENV_PATH}
	sudo chown ${USER}:${USER} ${PYENV_PATH} -R
	echo " ==> updating path"
	sudo cp "${0:A:h}/pyenv.template.sh" /etc/profile.d/pyenv.sh
fi
