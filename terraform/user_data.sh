#!/bin/bash
set -euxo pipefail

apt-get update
apt-get install -y docker.io docker-compose-plugin
systemctl enable docker
systemctl start docker

mkdir -p /opt/${app_name}
cat >/etc/motd <<EOM
${app_name} bootstrap complete.
Application port: ${app_port}
Deploy your compose bundle or container image into /opt/${app_name}.
EOM
