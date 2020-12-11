#!/bin/sh

set -ex

# There is an intermittent issue with DNS resolution in OSX with Travis.
# Fixing it with a static ip:
STATIC_IP="$(dig +short +tcp github.com)"
sudo bash -c "echo '${STATIC_IP} github.com' >> /private/etc/hosts"
cat /private/etc/hosts

brew update
./tests/test-utils/installs/brew-install bash zsh grep gnu-sed
# Coreutils and git should be already installed on OSX 7.3+ images:
#brew install coreutils git

BASE_NAME="$(dirname $0)"

"${BASE_NAME}"/install-fish.sh "$TRAVIS_FISH_VERSION"
