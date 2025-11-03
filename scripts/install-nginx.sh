#!/bin/bash

set -e  # Exit on any error

echo "Starting Nginx installation..."

# Update package index
apt-get update

# Install Nginx
apt-get install -y nginx

# Start and enable Nginx service
systemctl start nginx
systemctl enable nginx

# Configure firewall (if ufw is available)
if command -v ufw &> /dev/null; then
    ufw allow 'Nginx HTTP'
    ufw reload
fi

# Create a custom HTML page
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Azure VM - Nginx Server</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        h1 {
            color: #2c3e50;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
        }
        .status {
            background: #ecf0f1;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .success {
            color: #27ae60;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Welcome to Azure VM</h1>
        <p>This server is successfully provisioned with:</p>
        
        <div class="status">
            <p><span class="success">✓</span> Ubuntu 22.04 LTS</p>
            <p><span class="success">✓</span> Nginx Web Server</p>
            <p><span class="success">✓</span> Docker Engine</p>
            <p><span class="success">✓</span> Automated with Terraform</p>
            <p><span class="success">✓</span> CI/CD with GitHub Actions</p>
        </div>
        
        <h2>System Information</h2>
        <ul>
            <li><strong>Hostname:</strong> <span id="hostname">Loading...</span></li>
            <li><strong>Uptime:</strong> <span id="uptime">Loading...</span></li>
            <li><strong>Memory Usage:</strong> <span id="memory">Loading...</span></li>
            <li><strong>Disk Usage:</strong> <span id="disk">Loading...</span></li>
        </ul>
        
        <h2>Next Steps</h2>
        <p>You can now:</p>
        <ol>
            <li>Deploy your applications using Docker</li>
            <li>Configure Nginx as a reverse proxy</li>
            <li>Set up SSL certificates</li>
            <li>Monitor your infrastructure</li>
        </ol>
        
        <footer>
            <p><em>Provisioned with ❤️ using Terraform and Azure</em></p>
        </footer>
    </div>

    <script>
        // Simple client-side info display
        document.getElementById('hostname').textContent = window.location.hostname;
        
        // You can extend this with API calls to get system info
        setTimeout(() => {
            document.getElementById('uptime').textContent = 'System operational';
            document.getElementById('memory').textContent = 'Healthy';
            document.getElementById('disk').textContent = 'Adequate space';
        }, 1000);
    </script>
</body>
</html>
EOF

# Set proper permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Test Nginx configuration
nginx -t

# Reload Nginx to apply changes
systemctl reload nginx

# Verify Nginx is running
systemctl status nginx --no-pager

echo "Nginx installation completed successfully!"
echo "You can access your server at: http://$(curl -s ifconfig.me)"