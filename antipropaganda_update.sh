#!/bin/bash
echo "updating antipropaganda..."
rm -rf ./antipropaganda/
git clone https://github.com/qu4ma/antipropaganda.git
chmod +x ./antipropaganda/fuckputin.sh
echo "antipropaganda updated, runninng fuckputin.sh..."
sudo ./antipropaganda/fuckputin.sh