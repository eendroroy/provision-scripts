#!/usr/bin/env bash
SCRIPT_ROOT=$(dirname $(readlink -f $0))
RBENV_PATH="/usr/local/rbenv"
RBENV_PATH_TMP="/tmp/rbenv"
if [ -d ${RBENV_PATH} ]; then
  echo '########## rbenv already installed, skipping.'
else
  echo " ==> installing rbenv ..."
  sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev git > /dev/null
  git clone git://github.com/rbenv/rbenv.git ${RBENV_PATH_TMP} > /dev/null
  pushd ${RBENV_PATH_TMP}/src/configure && make -C src && popd > /dev/null
  echo " ==> installing plugins ..."
  mkdir -p ${RBENV_PATH_TMP}/plugins > /dev/null
  pushd ${RBENV_PATH_TMP}/plugins > /dev/null
  git clone git://github.com/rbenv/ruby-build.git > /dev/null
  git clone https://github.com/rbenv/rbenv-default-gems.git > /dev/null
  popd
  echo "bundler" | tee ${RBENV_PATH_TMP}/default-gems > /dev/null
	sudo mv ${RBENV_PATH_TMP} ${RBENV_PATH} > /dev/null
	sudo chown ${USER}:${USER} ${RBENV_PATH} -R > /dev/null
	echo " ==> updating path"
	sudo cp "${SCRIPT_ROOT}/rbenv.template.sh" /etc/profile.d/rbenv.sh > /dev/null
fi
