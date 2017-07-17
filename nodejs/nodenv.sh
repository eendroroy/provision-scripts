#/usr/bin/env bash
if [ -d ~/.nodenv ]; then
  echo '########## nodenv already installed, skipping.'
else
  echo " ==> installing dependencies ..."
  sudo apt-get install -y --force-yes libssl-dev libreadline-dev zlib1g-dev git > /dev/null
  echo " ==> installing nodenv ..."
  git clone https://github.com/nodenv/nodenv.git ~/.nodenv > /dev/null
  cd ~/.nodenv && src/configure && make -C src > /dev/null
  mkdir -p ~/.nodenv/plugins/ > /dev/null
  pushd ~/.nodenv/plugins/ > /dev/null
  echo " ==> installing node-build ..."
  git clone https://github.com/nodenv/node-build.git > /dev/null
  echo " ==> installing node-default-packages ..."
  git clone https://github.com/nodenv/nodenv-default-packages.git > /dev/null
  popd
  touch ~/.nodenv/default-packages
fi
