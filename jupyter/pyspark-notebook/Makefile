IMAGE = datawookie/pyspark-notebook
IMAGE_LATEST = $(IMAGE):latest

build:
	docker build --platform=linux/amd64 -t $(IMAGE_LATEST) .

build-no-cache:
	docker build --no-cache --platform=linux/amd64 -t $(IMAGE_LATEST) .

push:
	docker push $(IMAGE_LATEST)
