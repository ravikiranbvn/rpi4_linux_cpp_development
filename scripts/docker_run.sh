#!/bin/bash

# Error handling function
handle_error() {
    echo "Error: $1"
    exit 1
}

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    handle_error "Docker is not installed or not accessible. Please install Docker."
fi

# Check if the Docker image exists
IMAGE_NAME="rkbvn89/rpi4_linux_dev"
if ! docker image inspect $IMAGE_NAME &> /dev/null; then
    handle_error "Docker image '$IMAGE_NAME' not found. Please pull the image or specify a valid image name."
fi

# Get the user ID (UID) and group ID (GID) of the current user
HOST_UID=$(id -u)
HOST_GID=$(id -g)

# Run the Docker container with the specified volumes, mapping the local user to the container user
docker run -it -v ${PWD}:/home/builduser/ -e HOST_UID=$HOST_UID -e HOST_GID=$HOST_GID $IMAGE_NAME bash
