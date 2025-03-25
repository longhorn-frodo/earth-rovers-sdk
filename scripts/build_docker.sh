#!/bin/bash

ERC_SDK_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")/..
echo $ERC_SDK_DIR
docker build -t earth-rover-sdk $ERC_SDK_DIR
