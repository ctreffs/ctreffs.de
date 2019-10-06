#!/bin/bash

source ctreffs.de.secrets.sh

set -e

bundle exec jekyll clean
rm -rdf _site/

yarn install
bundle install

yarn check
yarn check --integrety
bundle exec jekyll doctor

bundle exec jekyll build

rsync -crvzh --progress --rsh='ssh -p22' --delete-after --delete-excluded _site/* $DEST
