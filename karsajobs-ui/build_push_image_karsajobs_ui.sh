#!/bin/bash

# Menghentikan script ketika terjadi error.
set -e

# Username Docker Hub dibaca dari environment variable.
IMAGE_NAME="${DOCKER_USERNAME}/karsajobs-ui:latest"

echo "==> Build Docker image: ${IMAGE_NAME}"

# Build image frontend menggunakan Dockerfile.
docker build -t "${IMAGE_NAME}" .

echo "==> Login ke Docker Hub"

# Password tidak disimpan dalam source code.
echo "${PASSWORD_DOCKER_HUB}" | \
    docker login -u "${DOCKER_USERNAME}" --password-stdin

echo "==> Push Docker image"

# Push image ke Docker Hub.
docker push "${IMAGE_NAME}"

echo "==> Docker image berhasil di-build dan di-push."
