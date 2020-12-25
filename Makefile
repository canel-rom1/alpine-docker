NAME ?= canel
REPO ?= canelrom1

tag = $(shell date +%Y%m%d.%H%M%S)

all: build

build: Dockerfile
	docker build --pull -t $(REPO)/alpine-$(NAME):$(tag) .
	docker tag $(REPO)/alpine-$(NAME):$(tag) $(REPO)/alpine-$(NAME):latest

run:
	docker run -it --rm $(REPO)/alpine-$(NAME):latest sh

push:
	git push
	git push github master --tags
