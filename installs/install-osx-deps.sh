#!/bin/sh
set -ex
brew update
brew install coreutils gnu-sed grep
# Openssl is required for installing git from source code
# Findutils is required for `fonts` Pearl package
brew install openssl findutils

./tests/test-utils/installs/install-bash.sh "$TRAVIS_BASH_VERSION"
./tests/test-utils/installs/install-zsh.sh "$TRAVIS_ZSH_VERSION"
./tests/test-utils/installs/install-fish.sh "$TRAVIS_FISH_VERSION"
./tests/test-utils/installs/install-git.sh "$TRAVIS_GIT_VERSION"

