all: push

container: image

image:
	docker build -t aghkkwiecien/worker:1.0.0 . # Build new image and automatically tag it as latest

push: image
	docker push aghkkwiecien/worker:1.0.0 # Push image tagged as latest to repository

clean:
