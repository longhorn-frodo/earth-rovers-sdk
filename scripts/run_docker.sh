#!/bin/bash
# Costa Rica Bot (Broken camera seed)
# BOT_SLUG=zinc-kilo-boar
# MISSION_SLUG=mission-1

# Cost rica Bot 1
# BOT_SLUG="alloy-mass-latch"
# MISSION_SLUG="mission-1-3276f3e6-3643-4826-b9d0-5f33e1eae97c"

# Costa Rica Bot 2 (Good)
# BOT_SLUG=warp-rail-upsilon 
# MISSION_SLUG=mission-1 

# Costa Rica Bot 3
# BOT_SLUG=arm-sigma-knob
# MISSION_SLUG=mission-1

# Cost Rice Bot 3 (Good)
# BOT_SLUG=rivet-knob-wrench
# MISSION_SLUG=mission-1-9b525faa-7221-4b3a-b5df-271480676832

# China bot
# BOT_SLUG=mando-wolf-loop
# MISSION_SLUG=mission-1

# China bot
# BOT_SLUG="grit-uv-flux"
# MISSION_SLUG="mission-1"

# PRELIMINARY CHALLENGE 1!
# BOT_SLUG="pico-stem-yak"
# MISSION_SLUG="wuhan-mission-3"

# PRELIMINARY CHALLENGE 2!
# BOT_SLUG="quota-stem-rho"
# MISSION_SLUG="mission-2-a3147668-a183-4fb4-a5eb-c3710ea1721d"

# PRELIMINARY CHALLENGE 3!
# BOT_SLUG="base-rivet-claw"
# MISSION_SLUG="mission-3"

# Ours (Updated)
BOT_SLUG="upsilon-zest-lion"

# Ours 
# BOT_SLUG="knit-weld-gnu"

# REHEARSAL 1
# BOT_SLUG="quirk-hen-crab"
# MISSION_SLUG="mission-3"

# REHEARSAL 2
# BOT_SLUG="fuse-emu-rack"
# MISSION_SLUG="mission-3"

# REHEARSAL 3 (wuhan)
# BOT_SLUG="code-wrench-inlay"
# MISSION_SLUG="mission-3"

# REHEARSAL 4 
# BOT_SLUG="hertz-koi-quirk"
# MISSION_SLUG="mission-3"

# REHEARSAL 5 (Singapore)
# BOT_SLUG="yoke-pym-disc"
# MISSION_SLUG="mission-3"

# REHEARSAL 6 (Singapore)
# BOT_SLUG="kilo-rivet-dock"
# MISSION_SLUG="mission-3-458f50c1-0ede-415a-bd1e-3ddc43391669"

# China
# BOT_SLUG="base-rivet-claw"
# MISSION_SLUG="mission-3"

# # 
# BOT_SLUG="acid-eel-pico"
# MISSION_SLUG="advanced-mission"



# BOT_SLUG="rivet-knob-wrench"
# MISSION_SLUG="mission-3-da52ddbb-684d-4518-b3c0-d4b19ae40f0d"

# BOT_SLUG="alloy-mass-latch"
# MISSION_SLUG="mission-3-d0c8dc6d-dc70-4173-9ce1-05d07863ad9a"

#Nairobi
# BOT_SLUG="odium-c3po-cub"
# MISSION_SLUG="mission-3-12bc7e9d-c37f-4788-9406-4f2503b3d300"

# Gabaroni
# BOT_SLUG="gene-zest-stark"
# MISSION_SLUG="mission-3-b5c16e1a-31dc-4087-9b07-0ef4950a731f"

# BOT_SLUG="quirk-hen-crab"
# MISSION_SLUG="mission-3"

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

# Runs without mission slug
docker run -it --rm \
    --net=host \
    --ipc=host \
    --pid=host \
    -e DEBUG=true \
    -e BOT_SLUG=$BOT_SLUG \
    -e MISSION_SLUG=$MISSION_SLUG \
    -e SDK_API_TOKEN=2KD87439sM1L4ioqxLT6WK9ZgWWade4psEj6E2FfNfNWtjQfGZ4GGGrKGu4nVaLCAPnjW8fi5RV8FtpHcnMB7UJxT7p3rscdexfF \
    -e CHROME_EXECUTABLE_PATH=/usr/bin/google-chrome \
    -e MAP_ZOOM_LEVEL=18 \
    -v /scratch/frodo_robot/frodo_baseline_ws/external/earth-rovers-sdk:/app/earth-rovers-sdk \
    earth-rover-sdk /bin/bash