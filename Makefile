REGISTRY_NAME?=docker.io/$(DOCKER_USER)
IMAGE_NAME=sops-operator
VERSION=latest
IMAGE_TAG=$(REGISTRY_NAME)/$(IMAGE_NAME):$(VERSION)

.PHONY: image publish

all: image publish

image:
	docker build -t $(IMAGE_TAG) -f Dockerfile .

publish:
	docker login -u $(DOCKER_USER) -p $(DOCKER_PWD)
	docker push $(IMAGE_TAG)