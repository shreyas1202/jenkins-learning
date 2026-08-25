#!/bin/bash

# Update the system
sudo dnf update -y

# Install Java 21 (required for latest Jenkins)
sudo dnf install -y java-21-amazon-corretto

# Verify Java installation
java -version

# Add the Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import the Jenkins GPG key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
sudo dnf install -y jenkins

# Reload systemd
sudo systemctl daemon-reload

# Enable Jenkins at boot
sudo systemctl enable jenkins

# Start Jenkins
sudo systemctl start jenkins

# Check Jenkins status
sudo systemctl status jenkins --no-pager

# Display the initial admin password
echo ""
echo "========== Jenkins Initial Admin Password =========="
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "===================================================="
