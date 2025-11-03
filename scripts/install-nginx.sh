#!/bin/bash

# Update package index
sudo apt-get update

# Install Nginx
sudo apt-get install -y nginx

# Create custom HTML page
sudo tee /var/www/html/index.html > /dev/null <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Nginx on Azure VM</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Azure VM</h1>
        <p>Nginx is successfully installed and running!</p>
        <p>This server was provisioned with Terraform.</p>
        <p>Current time: $(date)</p>
    </div>
</body>
</html>
EOF

# Configure Nginx
sudo tee /etc/nginx/sites-available/default > /dev/null <<EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    
    root /var/www/html;
    index index.html index.htm;
    
    server_name _;
    
    location / {
        try_files \$uri \$uri/ =404;
    }
    
    # Basic status page
    location /nginx_status {
        stub_status on;
        access_log off;
        allow all;
    }
}
EOF

# Enable and start Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Configure firewall
sudo ufw allow 'Nginx Full'

# Test Nginx configuration
sudo nginx -t

echo "Nginx installation and configuration completed!"
echo "You can access the web server at: http://$(curl -s ifconfig.me)"