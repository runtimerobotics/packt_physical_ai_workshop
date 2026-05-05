#!/usr/bin/env bash

set -euo pipefail

target_user="${SUDO_USER:-$(id -un)}"

# Function to validate supported Ubuntu versions
validate_ubuntu_version() {
    . /etc/os-release

    if [[ "${ID:-}" != "ubuntu" ]]; then
        echo "Unsupported OS: ${PRETTY_NAME:-unknown}. This script supports Ubuntu 22.04 and 24.04 only."
        exit 1
    fi

    case "${VERSION_ID:-}" in
        22.04|24.04)
            echo "Detected supported Ubuntu version: $VERSION_ID"
            ;;
        *)
            echo "Unsupported Ubuntu version: ${VERSION_ID:-unknown}. This script supports Ubuntu 22.04 and 24.04 only."
            exit 1
            ;;
    esac
}

# Function to check for NVIDIA GPU and driver
check_nvidia_driver() {
    if command -v nvidia-smi > /dev/null 2>&1 && nvidia-smi > /dev/null 2>&1; then
        echo "NVIDIA GPU and driver are properly installed."
        return 0
    fi

    if command -v lspci > /dev/null 2>&1 && lspci | grep -qi nvidia; then
        if nvidia-smi > /dev/null 2>&1; then
            echo "NVIDIA GPU and driver are properly installed."
            return 0
        else
            echo "NVIDIA GPU found, but driver is not installed or not working properly."
            return 1
        fi
    else
        echo "NVIDIA GPU not found, or lspci is not installed."
        return 1
    fi
}

# Function to install Docker
install_docker() {
    local ubuntu_codename

    echo "Installing Docker on the Host Machine"
    sudo apt update

    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    ubuntu_codename="$(. /etc/os-release && echo "$VERSION_CODENAME")"
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $ubuntu_codename stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin git openssh-server openssh-client
    sudo groupadd -f docker

    if [[ "$target_user" == "root" ]]; then
        echo "No non-root user detected. Run 'sudo usermod -aG docker <username>' for users who need Docker without sudo."
    else
        sudo usermod -aG docker "$target_user"
        echo "User '$target_user' has been added to the docker group."
        echo "Log out and log back in, reboot, or run 'newgrp docker' before using Docker without sudo."
    fi

    sudo systemctl restart docker

    echo "Docker Installation finished"
}

# Function to install NVIDIA Container Toolkit
install_nvidia_container_toolkit() {
    echo "Setting up NVIDIA Container Toolkit, make sure you have installed NVIDIA Graphics Driver"
    sudo apt install -y curl
    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor --yes -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
    && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

    sudo apt-get update
    sudo apt-get install -y nvidia-container-toolkit
    sudo nvidia-ctk runtime configure --runtime=docker
    sudo systemctl restart docker
}

# Check for NVIDIA driver and call the appropriate functions
validate_ubuntu_version

echo "Checking for NVIDIA GPU and driver..."

if check_nvidia_driver; then
    install_docker
    install_nvidia_container_toolkit
else
    install_docker
fi
