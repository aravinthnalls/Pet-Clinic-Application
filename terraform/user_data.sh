#!/bin/bash
set -euxo pipefail

apt-get update
apt-get install -y docker.io docker-compose-plugin curl
systemctl enable docker
systemctl start docker

mkdir -p /opt/${app_name}
cat >/opt/${app_name}/docker-compose.yml <<'COMPOSE'
services:
  app:
    image: ${app_image_repository}:${app_image_tag}
    restart: unless-stopped
    ports:
      - "${app_port}:${app_port}"
    environment:
      APP_PORT: "${app_port}"
      DB_HOST: postgres
      DB_PORT: "5432"
      DB_NAME: ${db_name}
      DB_USER: ${db_user}
      DB_PASSWORD: ${db_password}
    depends_on:
      postgres:
        condition: service_healthy
    healthcheck:
      test: ["CMD-SHELL", "curl -fsS http://localhost:${app_port}/ || exit 1"]
      interval: 30s
      timeout: 10s
      retries: 5
      start_period: 30s
  postgres:
    image: postgres:16
    restart: unless-stopped
    environment:
      POSTGRES_DB: ${db_name}
      POSTGRES_USER: ${db_user}
      POSTGRES_PASSWORD: ${db_password}
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U $$POSTGRES_USER -d $$POSTGRES_DB"]
      interval: 10s
      timeout: 5s
      retries: 10
volumes:
  postgres_data:

COMPOSE

cd /opt/${app_name}
docker compose pull || true
docker compose up -d

cat >/etc/motd <<EOM
${app_name} bootstrap complete.
Application port: ${app_port}
Image: ${app_image_repository}:${app_image_tag}
Compose bundle: /opt/${app_name}/docker-compose.yml
EOM
