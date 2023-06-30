#!/bin/bash

apt-get update -y
apt-get install -y python3-pip

pip3 install ansible

cat > inventory.ini <<EOF
[example-droplet]
$(terraform output -json | jq -r .example.ipv4_address)
EOF

cat > ansible.cfg <<EOF
[defaults]
inventory = inventory.ini
host_key_checking = False
EOF

ansible-playbook install_consul.yml --extra-vars "consul_version=<YOUR_CONSUL_VERSION>"
ansible-playbook install_nomad.yml --extra-vars "nomad_version=<YOUR_NOMAD_VERSION>"
