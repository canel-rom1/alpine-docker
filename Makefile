name ?= canel
prefix ?= canelrom1

tag = $(shell date +%y.%m.%d)

all: build

build: Dockerfile
	docker build -t $(prefix)/alpine-$(name):$(tag) .
	docker tag $(prefix)/alpine-$(name):$(tag) $(prefix)/alpine-$(name):latest

run:
	docker run --rm $(prefix)/alpine-$(name):latest

push:
	git push github master
	git push gitlab master
