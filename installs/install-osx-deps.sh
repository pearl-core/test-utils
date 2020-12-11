#!/bin/sh
set -ex
brew update
./tests/test-utils/installs/brew-install grep gnu-sed
# Coreutils and git should be already installed on OSX 7.3+ images:
#brew install coreutils git
# Openssl is required for installing git from source code
# Findutils is required for `fonts` Pearl package
./tests/test-utils/installs/brew-install openssl findutils

./tests/test-utils/installs/install-bash.sh "$TRAVIS_BASH_VERSION"
./tests/test-utils/installs/install-zsh.sh "$TRAVIS_ZSH_VERSION"
./tests/test-utils/installs/install-fish.sh "$TRAVIS_FISH_VERSION"
./tests/test-utils/installs/install-git.sh "$TRAVIS_GIT_VERSION"

