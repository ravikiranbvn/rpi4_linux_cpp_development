.PHONY:	all build run

all: build run

build:
	docker build -t rkbvn89/rpi4_linux_dev .

run:
	./scripts/docker_run.sh
