#!/bin/bash
set -euo pipefail

EXPORTER_VERSION="v1.9.1"
EXPORTER_FILE="node_exporter-1.9.1.linux-amd64"

# Download and extract
wget https://github.com/prometheus/node_exporter/releases/download/"${EXPORTER_VERSION}"/"${EXPORTER_FILE}".tar.gz
tar -xvf "${EXPORTER_FILE}.tar.gz"
cd "${EXPORTER_FILE}" || exit 1

# Install binary
sudo cp node_exporter /usr/local/bin/

# Create user if not exists
id -u node_exporter &>/dev/null || sudo useradd --no-create-home --shell /bin/false node_exporter
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Copy systemd service file (must exist alongside this script)
cd ..
sudo cp node_exporter.service /etc/systemd/system/node_exporter.service

# Start and enable service
sudo systemctl daemon-reload
sudo systemctl enable --now node_exporter
systemctl status node_exporter --no-pager

  
