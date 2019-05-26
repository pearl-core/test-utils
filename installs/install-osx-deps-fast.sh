#!/bin/sh

set -ex

brew update
brew install bash zsh git coreutils gnu-sed grep

./tests/test-utils/installs/install-fish.sh "$TRAVIS_FISH_VERSION"
