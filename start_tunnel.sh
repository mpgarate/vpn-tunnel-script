#!/usr/bin/env bash

set -euxo pipefail

# hk-hkg-br-001
BRIDGE="209.58.185.59"

kill $(ps aux | grep ssh | grep "$BRIDGE" | awk '{print $2}') || true

mullvad disconnect

sleep 5

mullvad tunnel openvpn proxy unset

mullvad tunnel openvpn proxy set local 1234 $BRIDGE 22

sshpass -p "mullvad" ssh -f -N -D 1234 mullvad@$BRIDGE

sleep 5

mullvad connect

mullvad status listen

# If necessary, open UI and change to Singapore or Japan
