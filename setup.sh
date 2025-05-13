#!/bin/bash

# This script is used to set up the TrackrEdge application backend

# Navigate to the script directory
cd "$(dirname "$0")"

echo "======================================================"
echo "Setting up TrackrEdge backend..."
echo "======================================================"

# Check if containers are already running
if [ "$(docker-compose ps -q -f name=trackredge-api)" ]; then
    echo "Error: TrackrEdge containers are not running."
    echo "Please start the containers using the start.sh script first."
    exit 1
fi

echo "Containers are running"
echo "Setting up .env file..."
docker exec -it trackredge-api bash -c 'if [ ! -f .env ]; then cp .env.example .env; fi'
docker exec -it trackredge-api php artisan key:generate

echo "Updating Composer dependencies..."
docker exec -it trackredge-api composer install

# Ensure the database is up and running


# Build and start the containers
