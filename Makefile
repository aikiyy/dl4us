.PHONY: run
docker-run-jupyter:
	docker run \
		-it \
		-d \
		--name dl4us \
		-p 8889:8888 \
		-v $(shell pwd):/home/jovyan/work \
		aikiyy/jupyter \
		start-notebook.sh \
		--NotebookApp.token='' \
		--NotebookApp.password=''

docker-build-tensorflow:
		docker build -t aikiyy/dl4us docker

docker-run-tensorflow:
	docker run \
		-it \
		-d \
		--name dl4us \
		-p 8889:8888 \
		-v $(shell pwd):/home/jovyan/work \
		aikiyy/dl4us \
		start-notebook.sh \
		--NotebookApp.token='' \
		--NotebookApp.password=''
