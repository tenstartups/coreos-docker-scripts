#!/bin/bash
set -e

# Set environment variables
DOCKER_IMAGE_NAME_REGEX="^\s*DOCKER_IMAGE_([_A-Z]+)=(.+)\s*$"

echo "Pre-pulling all required docker images"

# Pull all docker images at the start to ensure a smoother initialization
while read -r docker_image_name ; do
  /12factor/bin/docker-check-pull $docker_image_name
done < <(env | grep -E "${DOCKER_IMAGE_NAME_REGEX}" | sed -E "s/${DOCKER_IMAGE_NAME_REGEX}/\1/")

echo "Finished pre-pulling all required docker images"