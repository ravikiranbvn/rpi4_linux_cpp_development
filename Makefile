.PHONY:	all build run

all: build run

build:
	docker build -t rpi4-linux-dev .

run:
	./scripts/docker_run.sh
