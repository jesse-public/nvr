#!/usr/bin/env bash

docker compose down
docker compose pull
docker image prune -f
COMPOSE_BAKE=true docker compose up --build -d
