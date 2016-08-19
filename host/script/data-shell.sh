#!/bin/bash +x
set -e

/opt/bin/docker-check-pull "${PARASITE_DOCKER_IMAGE_SHELL}"
/usr/bin/docker run -it --rm \
  -v "<%= getenv!(:parasite_data_docker_volume) %>":"<%= getenv!(:parasite_data_directory) %>" \
  -w "<%= getenv!(:parasite_data_directory) %>" \
  ${PARASITE_DOCKER_IMAGE_SHELL} \
  sh -c "figlet 'Parasite Data' && ls -al && exec bash"
