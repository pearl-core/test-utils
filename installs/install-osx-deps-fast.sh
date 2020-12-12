#!/bin/sh

set -ex

BASE_NAME="$(dirname $0)"

# There is an intermittent issue with DNS resolution in OSX with Travis.
# Fixing it with a static ip:
STATIC_IP="$(dig +short +tcp github.com)"
sudo bash -c "echo '${STATIC_IP} github.com' >> /private/etc/hosts"
cat /private/etc/hosts

## Disabling brew update. It is very slow.
## https://github.com/Homebrew/brew/issues/9420
#git -C "/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core" fetch --unshallow
#git -C "/usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask" fetch --unshallow
#brew update

"${BASE_NAME}"/brew-install bash zsh grep gnu-sed fish
# Coreutils and git should be already installed on OSX 7.3+ images:
#brew install coreutils git
