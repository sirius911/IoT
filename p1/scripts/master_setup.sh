#!/bin/bash

echo "K3S for master : installing ..."
export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $(hostname) --node-ip $1  --bind-address=$1 --advertise-address=$1 "
curl -sfL https://get.k3s.io | sh -

sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/scripts/

echo "[TOOLS] : installing ..."
sudo yum install net-tools -y

echo "[machine : $(hostname)] has been setup succefully!"