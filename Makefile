.phony: build pull push image run

pull:
	docker image pull tchaypo/gollum:stable

build:
	docker image build -t tchaypo/gollum .

image: build

push:
	docker push tchaypo/gollum

run:
	docker run --rm -v $(CURDIR):/wiki -p 4567:80 tchaypo/gollum --live-preview
