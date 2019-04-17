.phony: build pull push image run stable

all: run

GITCONFIG = --mount type=bind,src=${HOME}/.gitconfig,dst=/root/.gitconfig,readonly=true
USER = $(shell id -u):$(shell id -g)

pull:
	docker image pull tchaypo/gollum:stable

build:
	docker image build -t tchaypo/gollum:latest .
image: build

push:
	docker push tchaypo/gollum

stable:
	git tag -f stable HEAD
	git push --tags origin master

run:
	docker run -u $(USER) --rm -v $(CURDIR):/wiki $(GITCONFIG) -p 4567 tchaypo/gollum --live-preview
