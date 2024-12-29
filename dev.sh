#!/bin/bash

# Function to stop all background processes on script exit
cleanup() {
    echo "Shutting down all processes..."
    kill $(jobs -p) 2>/dev/null
    exit
}

# Set up trap for cleanup on script exit
trap cleanup EXIT INT TERM

# Start the Rails backend
echo "Starting Rails backend..."
cd backend && bin/dev &

# Wait a bit for backend to start
sleep 5

# Start the Expo mobile app
echo "Starting Expo mobile app..."
cd ../mobile && npx expo start &

# Keep the script running and show logs
wait 