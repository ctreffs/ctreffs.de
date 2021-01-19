include ctreffs.de.secrets.make

check:
	yarn check
	yarn check --integrity
	bundle exec jekyll doctor

installYarn:
	yarn install

installJekyll:
	bundle install --jobs=4
	bundle exec jekyll doctor

install: installYarn installJekyll

clean:
	bundle exec jekyll clean
	rm -rd .bundle/

reset: clean
	rm Gemfile.lock
	rm -rdf node_modules

buildDev:
	bundle exec jekyll build --trace --unpublished

build:
	bundle exec jekyll build

clean-build: clean buildDev

watch:
	bundle exec jekyll build --watch --trace --unpublished

serve: check
	bundle exec jekyll serve --incremental --watch

outdated: check
	echo "Outdated yarn:"
	bundle exec yarn outdated
	echo "Outdated gems:"
	bundle outdated

upgrade-yarn:
	bundle exec yarn upgrade --latest
	yarn check
	yarn check --integrity

upgrade-bundle:
	bundle update --all --jobs=4
	bundle exec jekyll doctor -t

publish: clean check build
	echo "Uploading to: $(SERVER_DEST)"
	rsync -crvzh --progress --rsh='ssh -p22' --exclude '*secrets*' --exclude 'Makefile' --delete-after --delete-excluded _site/* $(SERVER_DEST)

help:
	bundle exec jekyll help

generateSecretsExample:
	touch example.secrets.make
	@echo "SERVER_DEST := <USERNAME>@<SSH_SERVER_ADDRESS>:<FOLDER>" >> example.secrets.make
