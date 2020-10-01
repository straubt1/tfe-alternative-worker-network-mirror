#!/bin/bash

date > /tmp/tomwashere # write something dynamic to prove we were here

cat >> /tmp/cli.tfrc << EOF

provider_installation {
  network_mirror {
    url = "https://tf-network-mirror-demo.s3.ca-central-1.amazonaws.com/"
  }
}
EOF

sleep 60 # only here to allow time to docker exec into the ephemeral run container