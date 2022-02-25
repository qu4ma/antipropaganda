#!/bin/bash
echo "installing antipropaganda..."
sudo apt update
sudo apt install git-all -y
sudo apt install wget -y
wget -O get-docker.sh https://get.docker.com
sudo sh get-docker.sh
sudo apt install -y docker-compose
rm -f get-docker.sh
sudo usermod -aG docker $USER
sudo docker pull alpine/bombardier
git clone https://github.com/qu4ma/antipropaganda.git
chmod +x ./antipropaganda/fuckputin.sh
echo "antipropaganda installed"
echo "run:"
echo "sudo ./antipropaganda/fuckputin.sh"