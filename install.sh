#!/bin/bash

# Function to build Docker images using Docker Compose
build_with_docker_compose() {
    echo "Building Docker images using Docker Compose..."
    docker-compose build
}

# Function to run containers using Docker Compose
run_with_docker_compose() {
    echo "Running containers using Docker Compose..."
    # docker-compose up -d
    ./matrix/start.sh
}

# Function to stop and remove containers using Docker Compose
stop_with_docker_compose() {
    echo "Stopping and removing containers using Docker Compose..."
    docker-compose down
}

# Function to build Prosody Docker image
build_prosody_image() {
    echo "Building Prosody Docker image..."
    docker build -t my-prosody -f prosody/Dockerfile prosody
}

# Function to build Converse.js Docker image
build_conversejs_image() {
    echo "Building Converse.js Docker image..."
    docker build -t my-conversejs -f converse-js/Dockerfile converse-js
}

# Function to run Prosody container
run_prosody_container() {
    echo "Running Prosody container..."
    docker run -d --name prosody-container my-prosody
}

# Function to run Converse.js container
run_conversejs_container() {
    echo "Running Converse.js container..."
    docker run -d --name conversejs-container --link prosody-container my-conversejs
}

# Function to stop and remove containers
stop_and_remove_containers() {
    echo "Stopping and removing containers..."
    docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}

# Function to remove Docker images
remove_images() {
    echo "Removing Docker images..."
    docker rmi $(docker images -q)
}

# Main menu
while true; do
    echo "Select an option:"
    echo "1. Build and run using Docker Compose"
    echo "2. Stop and remove containers using Docker Compose"
    echo "3. Build Prosody Docker image"
    echo "4. Build Converse.js Docker image"
    echo "5. Run Prosody container"
    echo "6. Run Converse.js container"
    echo "7. Stop and remove all containers"
    echo "8. Remove all images"
    echo "9. Exit"
    read -p "Enter option (1-9): " option

    # Perform selected action
    case $option in
        1)
            build_with_docker_compose
            run_with_docker_compose
            ;;
        2)
            stop_with_docker_compose
            ;;
        3)
            build_prosody_image
            ;;
        4)
            build_conversejs_image
            ;;
        5)
            run_prosody_container
            ;;
        6)
            run_conversejs_container
            ;;
        7)
            stop_and_remove_containers
            ;;
        8)
            remove_images
            ;;
        9)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please enter a number between 1 and 9."
            ;;
    esac
done
