#!/bin/bash

# Build script for M1_WiredUp Full Docker image with ROS2 GUI tools
# Optimized for Apple Silicon MacBook

set -e

# Configuration
IMAGE_NAME="m1-wiredup-full"
TAG="latest"
DOCKERFILE="Dockerfile"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Building M1_WiredUp Full Docker image with ROS2 GUI tools...${NC}"

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo -e "${RED}Error: Docker is not running. Please start Docker Desktop.${NC}"
    exit 1
fi

# Build the image
echo -e "${YELLOW}Building image: ${IMAGE_NAME}:${TAG}${NC}"
docker build \
    --platform linux/arm64 \
    --tag ${IMAGE_NAME}:${TAG} \
    --file ${DOCKERFILE} \
    .

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Successfully built ${IMAGE_NAME}:${TAG}${NC}"
    echo -e "${YELLOW}Image size:${NC}"
    docker images ${IMAGE_NAME}:${TAG} --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"
    
    echo -e "\n${GREEN}To run the container:${NC}"
    echo -e "${YELLOW}docker run -it --rm ${IMAGE_NAME}:${TAG}${NC}"
    
    echo -e "\n${GREEN}To run with GUI support (MacBook Silicon):${NC}"
    echo -e "${YELLOW}docker run -it --rm -e DISPLAY=host.docker.internal:0 -v /tmp/.X11-unix:/tmp/.X11-unix:rw ${IMAGE_NAME}:${TAG}${NC}"
else
    echo -e "${RED}❌ Build failed${NC}"
    exit 1
fi
