#!/bin/bash

# Menghentikan script apabila salah satu perintah mengalami error.
set -e

# Username Docker Hub diambil dari environment variable.
# Contoh:
# export DOCKER_USERNAME=usernameanda
#
# Password tidak ditulis langsung di source code.
# Contoh:
# export PASSWORD_DOCKER_HUB=passwordanda

IMAGE_NAME="${DOCKER_USERNAME}/karsajobs:latest"

echo "==> Build Docker image: ${IMAGE_NAME}"

# Membuat Docker image menggunakan Dockerfile pada directory ini.
docker build -t "${IMAGE_NAME}" .

echo "==> Login ke Docker Hub"

# Login menggunakan password dari environment variable
# sehingga password tidak disimpan di source code.
echo "${PASSWORD_DOCKER_HUB}" | \
    docker login -u "${DOCKER_USERNAME}" --password-stdin

echo "==> Push Docker image"

# Menguload image yang sudah dibuat ke Docker Hub.
docker push "${IMAGE_NAME}"

echo "==> Docker image berhasil di-build dan di-push."
