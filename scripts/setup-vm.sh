#!/bin/bash

# Update system
apt-get update
apt-get upgrade -y

# Install common packages
apt-get install -y \
    curl \
    wget \
    gnupg \
    lsb-release

# Conditionally install Docker
if [ "${install_docker}" = "true" ]; then
    echo "Installing Docker..."
    
    # Add Docker's official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    
    # Set up the stable repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    # Install Docker Engine
    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io
    
    # Start and enable Docker service
    systemctl start docker
    systemctl enable docker
    
    # Add user to docker group
    usermod -aG docker $admin_username
    
    echo "Docker installed successfully"
fi

# Conditionally install Nginx
if [ "${install_nginx}" = "true" ]; then
    echo "Installing Nginx..."
    
    apt-get install -y nginx
    
    # Start and enable Nginx service
    systemctl start nginx
    systemctl enable nginx
    
    # Create a simple HTML page
    cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Azure VM</title>
</head>
<body>
    <h1>Hello from Azure VM!</h1>
    <p>This server is running on:</p>
    <ul>
        <li>OS: Ubuntu 22.04 LTS</li>
        <li>Web Server: Nginx</li>
        <li>Docker: ${install_docker}</li>
    </ul>
    <p>Provisioned with Terraform and GitHub Actions</p>
</body>
</html>
EOF
    
    echo "Nginx installed successfully"
fi

# Print installation summary
echo "=== Installation Summary ==="
if [ "${install_docker}" = "true" ]; then
    docker --version
fi
if [ "${install_nginx}" = "true" ]; then
    nginx -v
fi