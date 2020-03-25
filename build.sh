#!/bin/bash

# This script is used to build the image for multiple architectures with buildx and qemu
# Install qemu-user-static before running the script

set -x

DOCKER_TAG=shenxn/smartthings-mqtt-bridge:latest

export DOCKER_CLI_EXPERIMENTAL=enabled  # enable experimental for buildx
docker login
docker buildx version
docker buildx create --name builder-multiarch-local --use
docker buildx inspect --bootstrap
docker buildx inspect
docker buildx build --platform linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 --tag $DOCKER_TAG --push .
