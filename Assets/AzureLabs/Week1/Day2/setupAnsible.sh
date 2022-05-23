#!/bin/sh
echo "Updating packages ..."
apt update -y
apt upgrade -y
apt install ansible -y