IMAGE_NAME=my-suite
CONTAINER_NAME=my-suite
HOST_NAME=my-suite
IS_MACOS := $(shell uname | grep -q Darwin && echo true)
HOSTS_FILE := $(if $(IS_MACOS),/private/etc/hosts,/etc/hosts)

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run \
		--rm \
		--name $(CONTAINER_NAME) \
		-p 80:80 \
		$(IMAGE_NAME)

stop:
	docker stop $(CONTAINER_NAME)

init-project:
	@if ! grep -q "my-suite" $(HOSTS_FILE); then \
		echo "# my-suite hosts" | sudo tee -a $(HOSTS_FILE); \
		echo "127.0.0.1 my-suite" | sudo tee -a $(HOSTS_FILE); \
		echo "Host added"; \
	else \
		echo "Host already exists"; \
	fi

build-run: build run
