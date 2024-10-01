#!/bin/bash

# 1. Instalar Docker
curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh

# 2. Instalar herramientas adicionales
sudo apt-get update
sudo apt install -y net-tools

# 4. Confirmar que Docker y Docker Compose están instalados correctamente
docker --version
docker compose version


echo "La máquina está lista para recibir imágenes Docker y ejecutar Docker Compose."
