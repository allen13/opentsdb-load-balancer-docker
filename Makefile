.PHONY: build deploy destroy shell test

IMAGE_NAME := opentsdb-load-balancer

default: build
build:
	docker build -t $(IMAGE_NAME) .
shell:
	docker run --rm -p 4242:4242 -t -i $(IMAGE_NAME) /bin/bash
