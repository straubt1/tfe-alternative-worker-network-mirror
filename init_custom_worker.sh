#!/bin/bash

# TERRAFORM_CONFIG is where the run stores its CLI configuration
# While this could change, it is usually "/tmp/cli.tfrc"
# NOTE: update the URL to point to your network mirror
cat >> ${TERRAFORM_CONFIG} << EOF

provider_installation {
  network_mirror {
    url = "https://tf-network-mirror-demo.s3.ca-central-1.amazonaws.com/"
  }
}
EOF

# [DEBUG] Adding a sleep here to allow time to docker exec into the ephemeral run container
# Only helpful when debugging the worker image code.
# sleep 60