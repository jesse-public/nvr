#!/usr/bin/env bash

docker compose down

cd gasket-builder
git pull
sudo apt remove gasket-dkms
sudo apt update
sudo apt full-upgrade
docker build --output . .
sudo dpkg -i ./gasket-dkms_1.0-18_all.deb

cd ..
docker compose pull
docker image prune -f
COMPOSE_BAKE=true docker compose up --build -d
