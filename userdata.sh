#!/bin/bash

# Update and install necessary packages
sudo apt-get update -y
sudo apt-get install -y unzip curl jq

# Set Vault version (replace with the version you want to install)
VAULT_VERSION="1.12.0"

# Download and install Vault
curl -O https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip
sudo unzip vault_${VAULT_VERSION}_linux_amd64.zip -d /usr/local/bin/
sudo chmod +x /usr/local/bin/vault

# Create Vault directories
sudo mkdir -p /etc/vault /var/vault/data
sudo chown -R ubuntu:ubuntu /etc/vault /var/vault

# Configure Vault (server mode, single-node development configuration)
sudo tee /etc/vault/config.hcl > /dev/null <<EOF
storage "file" {
  path = "/var/vault/data"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}

ui = true
EOF

# Set up environment variables
echo 'export VAULT_ADDR="http://127.0.0.1:8200"' >> ~/.bashrc
source ~/.bashrc

# Create systemd service for Vault
sudo tee /etc/systemd/system/vault.service > /dev/null <<EOF
[Unit]
Description=Vault
Documentation=https://www.vaultproject.io/docs/
Requires=network-online.target
After=network-online.target

[Service]
ExecStart=/usr/local/bin/vault server -config=/etc/vault/config.hcl
ExecReload=/bin/kill --signal HUP $MAINPID
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF

# Enable and start Vault service
sudo systemctl enable vault
sudo systemctl start vault

# Print Vault status
vault status

# Initialize Vault (optional; uncomment if you want to auto-unseal the Vault)
# vault operator init -key-shares=1 -key-threshold=1 > /etc/vault/init-keys.txt

echo "Vault installation and setup completed!"
