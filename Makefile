check:
	yarn check
	yarn check --integrity
	bundle exec jekyll doctor

install:
	yarn install
	yarn check
	yarn check --integrity
	bundle install --jobs=4
	bundle exec jekyll doctor

clean:
	bundle exec jekyll clean

reset: clean
	rm Gemfile.lock
	rm -rdf node_modules

build: install
	bundle exec jekyll build

clean-build: clean build

watch:
	bundle exec jekyll build --watch

serve: check
	bundle exec jekyll serve --incremental --watch

outdated: check
	bundle exec yarn outdated
	bundle outdated

upgrade-yarn:
	bundle exec yarn upgrade --latest
	yarn check
	yarn check --integrity

upgrade-bundle:
	bundle update --all --jobs=4
	bundle exec jekyll doctor

publish: clean check build
	source ctreffs.de.secrets.sh
	rsync -crvzh --progress --rsh='ssh -p22' --delete-after --delete-excluded _site/* $DEST