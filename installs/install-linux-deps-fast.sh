#!/bin/sh

set -ex

sudo apt-get -qq update
sudo apt-get install -y zsh bash git python3

wget -qO- https://bootstrap.pypa.io/get-pip.py | sudo python3

BASE_NAME="$(dirname $0)"

"${BASE_NAME}"/install-fish.sh "$TRAVIS_FISH_VERSION"

python3 -m pip install --user pearlcli

~/.local/bin/pearl init
