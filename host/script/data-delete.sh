#!/bin/bash +x
set -e

# Clear out the existing data volume
/opt/bin/send-notification warn "Deleting existing \`parasite\` data files"
/usr/bin/docker run --rm \
  -v ${DOCKER_VOLUME_PARASITE_DATA}:"<%= getenv!(:data_directory) %>" \
  -w "<%= getenv!(:data_directory) %>" \
  ${DOCKER_IMAGE_SHELL} \
  sh -c 'rm -rf *'