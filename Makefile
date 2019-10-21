include ctreffs.de.secrets.make

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

buildDev: install
	bundle exec jekyll build --trace --unpublished

build: install
	bundle exec jekyll build

clean-build: clean buildDev

watch:
	bundle exec jekyll build --watch --trace --unpublished

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
	echo "Uploading to: $(SERVER_DEST)"
	rsync -crvzh --progress --rsh='ssh -p22' --exclude '*secrets*' --exclude 'Makefile' --delete-after --delete-excluded _site/* $(SERVER_DEST)