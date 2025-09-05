#!/bin/bash
set -euo pipefail

# ------------------------------
# Configuration
# ------------------------------
PROMETHEUS_VERSION="v3.5.0"
PROMETHEUS_FILE="prometheus-3.5.0.linux-amd64"
DOWNLOAD_URL="https://github.com/prometheus/prometheus/releases/download/${PROMETHEUS_VERSION}/${PROMETHEUS_FILE}.tar.gz"

# ------------------------------
# Logging functions
# ------------------------------
log() { echo -e "\e[32m[INFO]\e[0m $1"; }
error() { echo -e "\e[31m[ERROR]\e[0m $1"; exit 1; }

# ------------------------------
# Cleanup old installation
# ------------------------------
if [ -d "/etc/prometheus" ] || [ -d "/var/lib/prometheus" ]; then
    log "Cleaning up old Prometheus installation..."
    sudo systemctl stop prometheus || true
    sudo rm -rf /etc/prometheus /var/lib/prometheus
fi

# ------------------------------
# Create Prometheus user
# ------------------------------
if ! id "prometheus" &>/dev/null; then
    log "Creating prometheus user..."
    sudo useradd --no-create-home --shell /bin/false prometheus
fi

# ------------------------------
# Create directories
# ------------------------------
log "Creating directories..."
sudo mkdir -p /etc/prometheus /var/lib/prometheus
sudo chown prometheus:prometheus /etc/prometheus /var/lib/prometheus

# ------------------------------
# Download Prometheus
# ------------------------------
if [ ! -f "${PROMETHEUS_FILE}.tar.gz" ]; then
    log "Downloading Prometheus ${PROMETHEUS_VERSION}..."
    wget "${DOWNLOAD_URL}" -O "${PROMETHEUS_FILE}.tar.gz" || error "Download failed"
fi

# ------------------------------
# Extract tarball
# ------------------------------
log "Extracting Prometheus..."
tar -xvf "${PROMETHEUS_FILE}.tar.gz"
EXTRACT_DIR="${PROMETHEUS_FILE}"

# ------------------------------
# Install binaries
# ------------------------------
log "Installing binaries..."
sudo cp "${EXTRACT_DIR}/prometheus" "${EXTRACT_DIR}/promtool" /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool

# ------------------------------
# Install configuration
# ------------------------------
log "Installing configuration..."
sudo cp "${EXTRACT_DIR}/prometheus.yml" /etc/prometheus/
sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml

# ------------------------------
# Setup systemd service
# ------------------------------
log "Setting up systemd service..."
sudo cp prometheus.service /etc/systemd/system/prometheus.service
sudo systemctl daemon-reload
sudo systemctl enable --now prometheus

# ------------------------------
# Finish
# ------------------------------
log "Prometheus ${PROMETHEUS_VERSION} installation completed!"
sudo systemctl status prometheus --no-pager


