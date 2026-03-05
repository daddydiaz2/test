#!/bin/bash
set -e  # Detener si hay error

echo "==> Instalando dependencias..."
sudo apt-get update -y
sudo apt-get install -y curl wget unzip

echo "==> Instalando fnm..."
curl -fsSL https://fnm.vercel.app/install | bash

echo "==> Cargando fnm en la sesión actual..."
export FNM_PATH="$HOME/.local/share/fnm"
export PATH="$FNM_PATH:$PATH"
eval "$(fnm env --use-on-cd)"

echo "==> Instalando Node 22..."
fnm install 22
fnm use 22
fnm default 22

echo "==> Instalando @kilocode/cli..."
npm install -g @kilocode/cli

echo "==> Listo! Versiones instaladas:"
node -v
npm -v
