SHELL := /bin/bash

ifndef WORKFLOW_DIR
$(info Using default WORKFLOW_DIR=montage0.25)
WORKFLOW_DIR=montage0.25
endif

ifndef WORKFLOW_DEGREE
$(info Using default WORKFLOW_DEGREE=0.25)
WORKFLOW_DEGREE = 0.25
endif

ifndef NUMBER_OF_TASKS
$(info Using default NUMBER_OF_TASKS=43)
NUMBER_OF_TASKS = 43
endif

DATA_NAME ?= $(shell basename $(WORKFLOW_DIR))
NUMBER_OF_FILES=$(shell wc -l $(WORKFLOW_DIR) | cut -d' ' -f1)

all: push

push: push-workflow-data
images: image-workflow-data 

image-workflow-data:
	echo "*" > .dockerignore
	echo "!$(WORKFLOW_DIR)" >> .dockerignore
	docker build --squash --build-arg WORKFLOW_DIR=$(WORKFLOW_DIR) --build-arg WORKFLOW_DEGREE=$(WORKFLOW_DEGREE) --build-arg NUMBER_OF_TASKS=$(NUMBER_OF_TASKS) -t aghkkwiecien/data:1.0.0 . # Build new image and automatically tag it as latest

push-workflow-data: image-workflow-data
	docker push aghkkwiecien/data:1.0.0 # Push image tagged as latest to repository

clean:
	rm .dockerignore

