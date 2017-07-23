#/usr/bin/env bash
NODENV_PATH="/usr/local/nodenv"
NODENV_PATH_TMP="/tmp/nodenv"
if [ -d "${NODEND_PATH}" ]; then
  echo '########## nodenv already installed, skipping.'
else
  echo " ==> installing dependencies ..."
  sudo apt-get install -y --force-yes libssl-dev libreadline-dev zlib1g-dev git > /dev/null
  echo " ==> installing nodenv ..."
  git clone https://github.com/nodenv/nodenv.git "${NODENV_PATH_TMP}" > /dev/null
  cd "${NODENV_PATH_TMP}" && src/configure && make -C src > /dev/null
  mkdir -p "${NODENV_PATH_TMP}"/plugins/ > /dev/null
  pushd "${NODENV_PATH_TMP}"/plugins/ > /dev/null
  echo " ==> installing node-build ..."
  git clone https://github.com/nodenv/node-build.git > /dev/null
  echo " ==> installing node-default-packages ..."
  git clone https://github.com/nodenv/nodenv-default-packages.git > /dev/null
  popd
  touch "${NODENV_PATH_TMP}/default-packages"
	sudo mv ${NODENV_PATH_TMP} ${NODENV_PATH}
	sudo chown ${USER}:${USER} ${NODENV_PATH} -R
	echo " ==> updating path"
	sudo cp "${0:A:h}/exenv.template.sh" /etc/profile.d/nodenv.sh
fi
