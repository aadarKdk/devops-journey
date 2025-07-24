## Minikube + Docker + kubectl Setup Guide for (Ubuntu-based OS: POP!_OS)

This guide provides the **complete step-by-step installation process** for setting up a local Kubernetes cluster using **Minikube** with **Docker** as the container driver, along with **kubectl** CLI.

---

### Prerequisites

- OS: Pop!_OS / Ubuntu-based Linux
- Terminal with sudo privileges
- Internet connection

---

###  1. Install Required Packages

```bash
sudo apt update
sudo apt install -y curl apt-transport-https ca-certificates gnupg lsb-release

### 2. Install Docker Engine
```bash
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker   
```

### 3. Install kubectl (Kubernetes CLI)
```bash
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
```
Verify:
```bash
kubectl version
```

### 4. Install Minikube
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64
```
Verify: 
```bash
minikube version
```

### 5. Set Docker as Default Minikube Driver
```bash
minikube config set driver docker
```

### 6. Start Minikube (using Docker)
```bash
minikube start
```

### 7. minikube start
```bash
minikube status
kubectl get nodes
```
Versions to Verify
```bash
docker --version
kubectl version 
minikube version
```
