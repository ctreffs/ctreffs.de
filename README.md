# ctreffs.de

[![Build Status](https://travis-ci.com/ctreffs/ctreffs.de.svg?branch=master)](https://travis-ci.com/ctreffs/ctreffs.de)

I'm the forgetful type therefore this readme serves as a reminder how to build and maintain this repo.

## Tools

- [Bundler](https://bundler.io/v1.16)
- [Jekyll](https://jekyllrb.com/docs/usage/)
- [Yarn](https://yarnpkg.com/en/docs/usage)

## Install

`yarn install`

`bundle install`

## Update

`bundle update`

`bundle exec yarn upgrade`


## Build

`bundle exec jekyll clean`

`bundle exec jekyll build`

`bundle exec jekyll build --watch`

`bundle exec jekyll serve --incremental --watch`

## Check

`yarn check`

`yarn check --integrity`

`bundle exec jekyll doctor`

## Publish

### Web hosting providers (FTP)Permalink

1. `bundle exec jekyll build` 
2. copy contents of the generated `_site` folder to host's `httpdocs` or `public_html` folder