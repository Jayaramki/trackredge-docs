#!/bin/bash

# Navigate to the script directory
cd "$(dirname "$0")"

#Function to clean and reinstall node_modules for Angular
clean_angular_deps() {
    echo "Cleaning and reinstalling node_modules for Angular..."
    docker exec trackredge-portal rm -rf /app/node_modules
    docker exec trackredge-portal npm install
}

# Function to clean and reinstall Laravel dependiencies
clean_laravel_deps() {
    echo "Cleaning and reinstalling Laravel dependencies..."
    docker exec trackredge-api rm -rf /var/www/html/vendor
    docker exec trackredge-api composer install --no-interaction
    docker exec trackredge-api php artisan optimize:clear
    docker exec trackredge-api php artisan config:clear
    docker exec trackredge-api php artisan cache:clear
}

handle_migrations() {
    echo "Running database migrations..."
    docker exec trackredge-api php artisan migrate --force
}

handle_seeders() {
    echo "Running database seeders..."
    docker exec trackredge-api php artisan db:seed --class=DatabaseSeeder
}

clean_all_deps() {
    clean_angular_deps
    clean_laravel_deps
    handle_migrations
    handle_seeders
}

# Check if containers are already running
if [ "$(docker-compose ps -q -f name=trackredge-api)" ] && [ "$(docker-compose ps -q -f name=trackredge-portal)" ]; then
    echo "Containers are already running."
    echo "Stopping and removing containers..."
    docker-compose down
    docker-compose up -d --build
    sleep 5 # Wait for containers to start
    clean_all_deps
    echo "Containers restarted successfully."
    exit 0
fi

# Check if containers are not running
if [ ! "$(docker-compose ps -q -f name=trackredge)" ]; then
    echo "Containers are not running."
    echo "Starting containers..."
    docker-compose up -d
else
    echo "First-time setup. Building containers (this may take several minutes)..."
    docker-compose up -d --build
fi

# Wait a few seconds for containers to be fully up
echo "Waiting for containers to be fully up..."
sleep 5

# Clean all dependencies
echo "Cleaning all dependencies..."
clean_all_deps

echo ""
echo "TrackrEdge development environment started!"
echo ""
echo "Services available at:"
echo " - Angular: http://localhost:4200"
echo " - Laravel: http://localhost:8000"
echo " - PostgreSQL: localhost:5432"
echo " - pgAdmin: http://localhost:5050"
echo ""
echo "Database connection Info:"
echo " - Host: postgres"
echo " - Port: 5432"
echo " - Username: postgres"
echo " - Password: postgres"
echo ""
echo "To stop the environment, run 'docker-compose down'"
echo ""
echo "FIRST-TIME SETUP: If this is your first time running this application,"
echo "run the following command to set up the Laravel backend:"
echo ""
echo " ./setup.sh"
ehco ""

