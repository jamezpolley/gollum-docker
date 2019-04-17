.phony: build pull push image run stable

all: run

pull:
	docker image pull tchaypo/gollum:stable

build:
	docker image build -t tchaypo/gollum:latest .

image: build

push:
	docker push tchaypo/gollum

stable:
	docker tag stable HEAD
	git push --tags origin master

run:
	docker run --rm -v $(CURDIR):/wiki \
		--mount type=bind,source=${HOME}/.gitconfig,dst=/root/.gitconfig,ro=true \
		-p 4567:80 tchaypo/gollum --live-preview
