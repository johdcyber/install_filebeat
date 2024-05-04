#!/bin/bash

# This script installs Filebeat on an Ubuntu system with verbose logging and error handling.

# Function to display error messages and exit
function error_exit {
    echo "Error: $1" >&2
    exit 1
}

# Enable verbose execution
set -o verbose

# Start script execution
echo "Starting Filebeat installation..."

# Update package index
sudo apt-get update || error_exit "Failed to update package index."

# Install necessary packages for adding a new repository securely
sudo apt-get install -y wget apt-transport-https || error_exit "Failed to install necessary packages."

# Download and install the Public Signing Key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - || error_exit "Failed to install Elasticsearch GPG key."

# Add the Elastic repository to the system
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list || error_exit "Failed to add Elastic repository."

# Optional: Use the OSS version of the packages
# echo "deb https://artifacts.elastic.co/packages/oss-8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list || error_exit "Failed to add OSS Elastic repository."

# Update the package index again to include the new repository
sudo apt-get update || error_exit "Failed to update package index after adding repository."

# Install Filebeat
sudo apt-get install -y filebeat || error_exit "Failed to install Filebeat."

# Enable Filebeat to start automatically during boot
sudo systemctl enable filebeat || error_exit "Failed to enable Filebeat service."

echo "Filebeat installation and setup completed successfully. Filebeat will now start automatically on boot."
