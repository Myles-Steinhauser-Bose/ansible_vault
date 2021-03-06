#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
fi

VERSION=$1

mkdir -p build

echo "Creating release tag"
git checkout master && git pull
github-release release -u sidick -r ansible_vault -t v${VERSION} -p

echo "Creating archive"
tar cjf build/ansible_vault.tbz README.md library

echo "Upload release archive"
github-release upload -u sidick -r ansible_vault -t v${VERSION} -n ansible_vault-v${VERSION}.tar.bz2 -f build/ansible_vault.tbz
