#!/bin/bash

set -e

echo "Building Docker containers..."
docker-compose -f ./docker/docker-compose.yml up -d gitlab
echo "Waiting for Docker containers to finish setting up..."
attempt=1
MAX_TRIES=60
while [ ! -f ./docker/config/token ]; do
    sleep 10
    if [ $attempt -gt $MAX_TRIES ]; then
        echo "Error: Gitlab not responding, cancelling set up"
        if [ "$TRAVIS" != "true" ];
            then rm -f ./docker/config/token;
        fi
        exit 1
    fi
done
docker-compose -f ./docker/docker-compose.yml run test
echo "Tests complete, stop and remove Docker containers..."
docker-compose -f ./docker/docker-compose.yml down
if [ "$TRAVIS" != "true" ];
  then rm -f ./docker/config/token;
fi