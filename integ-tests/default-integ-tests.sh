#!/usr/bin/env sh

set -e

hash -r
git --version
bash --version
zsh --version
fish --version
./tests/bunit/bin/checkstyle.sh ./bin/ ./lib/
./tests/bunit/bin/unit-tests.sh ./tests/unit-tests


echo "PEARL_PACKAGES['test'] = {'url': '${PWD}'}" >> ~/.config/pearl/pearl.conf
pearl list

BASE_NAME="$(dirname $0)"

bash "${BASE_NAME}"/integ-tests.sh
zsh "${BASE_NAME}"/integ-tests.sh
fish "${BASE_NAME}"/integ-tests.fish
