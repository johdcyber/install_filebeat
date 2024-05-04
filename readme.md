# Filebeat Installer for Ubuntu

This Bash script automates the installation of Filebeat on Ubuntu systems. Filebeat is a lightweight shipper for forwarding and centralizing log data. This script sets up Filebeat to start automatically at boot and configures it to send data to Elasticsearch.

## Prerequisites

- A machine running Ubuntu (16.04, 18.04, 20.04, or 22.04).
- User must have `sudo` privileges.
- Internet connection for downloading packages.

## Installation

1. **Download the Script**
   - Clone this repository or download the `install_filebeat.sh` script directly.

   ```bash
   wget https://path_to_your_repository/install_filebeat.sh
