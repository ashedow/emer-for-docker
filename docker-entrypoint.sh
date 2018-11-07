#!/bin/bash
set -eo pipefail

echo "server=1
rpsssl=0
listen=1
maxconnections=${MAX_CONNECTIONS}
rpcuser=${RPC_USER}
rpcpassword=${RPC_PASS}
rpcallowip=${RPC_ALLOW_IP}
rpcport=${RPC_PORT}
port=${PORT}
testnet=${TESTNET}" > /data/emercoin/emercoin.conf

exec "$@"
