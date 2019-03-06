IMAGE_NAME=$(shell basename $(CURDIR))

.PHONY: docker-build
docker-build: ## Build the top level Dockerfile using the directory or $IMAGE_NAME as the name.
	docker build -t $(IMAGE_NAME) .

.PHONY: docker-run
docker-run:
  docker run -it --rm -v $PWD:/workspace -w /workspace $(IMAGE_NAME)
