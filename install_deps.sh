#!/usr/bin/env bash

set -euxo pipefail

echo "download mullvad deb from: https://www.mullvad.net/en/download/"

sudo apt-get install -y \
  sshpass
