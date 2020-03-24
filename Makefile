name ?= canel
prefix ?= canelrom1

tag = $(shell date +%y.%m.%d)

all: build

build: Dockerfile
	docker build --pull -t $(prefix)/alpine-$(name):$(tag) .
	docker tag $(prefix)/alpine-$(name):$(tag) $(prefix)/alpine-$(name):latest

run:
	docker run -it --rm $(prefix)/alpine-$(name):latest sh

push:
	git push github master
	git push gitlab master
