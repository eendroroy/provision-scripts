#!/usr/bin/env bash
SCRIPT_ROOT=$(dirname $(readlink -f $0))
PYENV_PATH="/usr/local/pyenv"
PYENV_PATH_TMP="/tmp/pyenv"
if [ -d ${PYENV_PATH} ]; then
  echo '########## pyenv already installed, skipping.'
else
  echo " ==> installing dependencies ..."
  sudo apt-get install -y --force-yes libssl-dev libreadline-dev zlib1g-dev git > /dev/null
  sudo apt-get install -y --force-yes build-essential checkinstall > /dev/null
  sudo apt-get install -y --force-yes libreadline-gplv2-dev libncursesw5-dev \
		   libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev > /dev/null
  echo " ==> installing pyenv ..."
  git clone https://github.com/pyenv/pyenv.git ${PYENV_PATH_TMP}
  mkdir -p ${PYENV_PATH_TMP}/plugins > /dev/null
  pushd ${PYENV_PATH_TMP}/plugins > /dev/null
  echo " ==> installing pyenv-cache ..."
  git clone https://github.com/pyenv/pyenv-ccache.git > /dev/null
  echo " ==> installing pyenv-version-ext ..."
  git clone https://github.com/pyenv/pyenv-version-ext.git > /dev/null
	sudo mv ${PYENV_PATH_TMP} ${PYENV_PATH} > /dev/null
	sudo chown ${USER}:${USER} ${PYENV_PATH} -R > /dev/null
	echo " ==> updating path"
	sudo cp "${SCRIPT_ROOT}/pyenv.template.sh" /etc/profile.d/pyenv.sh > /dev/null
fi
