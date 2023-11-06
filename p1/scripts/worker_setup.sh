#!/bin/bash

export TOKEN_FILE="/vagrant/scripts/node-token"
export INSTALL_K3S_EXEC="agent --server https://$1:6443 --token-file $TOKEN_FILE --node-ip=$2"

echo "K3S for worker : installing ..."
curl -sfL https://get.k3s.io | sh -

echo "[TOOLS] : installing ..."
sudo yum install net-tools -y

echo "[machine : $(hostname)] has been setup succefully!"