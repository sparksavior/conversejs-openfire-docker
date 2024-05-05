#!/bin/bash

# Function to build Docker image
build_image() {
    echo "Building Docker image..."
    docker build \
    --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
    --build-arg APPLICATION_NAME=conversejs \
    --build-arg BUILD_VERSION=v1.0 \
    --file Dockerfile \
    --tag conversejs/converse.js:latest \
    .
}

# Function to clean up containers and images
clean_up() {
    # Check if container exists and stop it
    if docker ps -a --filter "name=conversejs_container" --format '{{.Names}}' | grep -q "conversejs_container"; then
        echo "Stopping and removing container..."
        docker stop conversejs_container
        docker rm conversejs_container
    else
        echo "No running container found."
    fi

    # Check if image exists and delete it
    if docker images --format '{{.Repository}}:{{.Tag}}' | grep -q "my_image"; then
        echo "Deleting Docker image..."
        docker rmi my_image
    else
        echo "No image found."
    fi
}

# Function to run Docker container
run_container() {
    echo "Running Docker container..."
    docker run -d -p 80:80 --name conversejs_container conversejs/converse.js:latest
}

# Main menu
echo "Select an option:"
echo "1. Build Docker image"
echo "2. Clean up (stop and remove container, delete image)"
echo "3. Run Docker container"
read -p "Enter option (1, 2, or 3): " option

# Perform selected action
case $option in
    1)
        build_image
        ;;
    2)
        clean_up
        ;;
    3)
        run_container
        ;;
    *)
        echo "Invalid option. Please enter 1, 2, or 3."
        ;;
esac
