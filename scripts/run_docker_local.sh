#!/bin/bash

BOT_SLUG="upsilon-zest-lion"

CONTAINER_NAME="earth-rover-sdk"
# Check if the container is already running
if [[ "$(docker ps -q -f name=$CONTAINER_NAME)" ]]; then
    echo "Stopping the already running container..."
    docker ps | grep $CONTAINER_NAME | awk '{print $1}' | xargs docker stop
fi

# Check if a container with the same name exists (but is stopped or exited)
if [[ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]]; then
    echo "Removing the existing container..."
    docker ps | grep $CONTAINER_NAME | awk '{print $1}' | xargs docker rm
fi

# Runs with mission slug
docker run -it --rm \
    --net=host \
    --ipc=host \
    --pid=host \
    -e DEBUG=true \
    -e BOT_SLUG=$BOT_SLUG \
    -e SDK_API_TOKEN=2KD87439sM1L4ioqxLT6WK9ZgWWade4psEj6E2FfNfNWtjQfGZ4GGGrKGu4nVaLCAPnjW8fi5RV8FtpHcnMB7UJxT7p3rscdexfF \
    -e CHROME_EXECUTABLE_PATH=/usr/bin/google-chrome \
    -e MAP_ZOOM_LEVEL=18 \
    -v /scratch/frodo_robot/frodo_baseline_ws/src:/app/frodo_baseline_ws \
    earth-rover-sdk

