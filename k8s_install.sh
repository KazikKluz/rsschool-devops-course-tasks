#! /bin/bash
apt update -y
apt upgrade -y
ufw disable
curl -sfL https://get.k3s.io | sh -
sleep 1m
sudo k3s kubectl get node