#!/bin/sh
set -ex

BASE_NAME="$(dirname $0)"

# There is an intermittent issue with DNS resolution in OSX with Travis.
# Fixing it with a static ip:
STATIC_IP="$(dig +short +tcp github.com)"
sudo bash -c "echo '${STATIC_IP} github.com' >> /private/etc/hosts"
cat /private/etc/hosts

## https://github.com/Homebrew/brew/issues/9420
#git -C "/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core" fetch --unshallow
#git -C "/usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask" fetch --unshallow
#brew update

"${BASE_NAME}"/brew-install grep gnu-sed
# Coreutils and git should be already installed on OSX 7.3+ images:
#brew install coreutils git
# Openssl is required for installing git from source code
# Findutils is required for `fonts` Pearl package
"${BASE_NAME}"/brew-install openssl findutils

"${BASE_NAME}"/install-bash.sh "$TRAVIS_BASH_VERSION"
"${BASE_NAME}"/install-zsh.sh "$TRAVIS_ZSH_VERSION"
"${BASE_NAME}"/install-fish.sh "$TRAVIS_FISH_VERSION"
"${BASE_NAME}"/install-git.sh "$TRAVIS_GIT_VERSION"
