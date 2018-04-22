#!/bin/bash

set -e

yarn install
bundle install

yarn check
yarn check --integrety
bundle exec jekyll doctor

bundle exec jekyll build

open ./_site