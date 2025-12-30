#!/bin/bash

# Atualizações APT (pacotes tradicionais)
echo -e "\n\033[1;32m[1/5] Atualizando pacotes APT...\033[0m"
sudo apt update -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean

# Atualizações Flatpak
echo -e "\n\033[1;32m[2/5] Atualizando Flatpaks...\033[0m"
flatpak update -y
flatpak uninstall --unused -y

# Atualizações Snap
echo -e "\n\033[1;32m[3/5] Atualizando Snaps...\033[0m"
sudo snap refresh

# Atualizações de firmware (opcional)
echo -e "\n\033[1;32m[4/5] Verificando firmware...\033[0m"
sudo fwupdmgr refresh
sudo fwupdmgr update

# Limpeza final
echo -e "\n\033[1;32m[5/5] Limpando cache...\033[0m"
rm -rf ~/.cache/*
echo -e "\n\033[1;35mConcluído! Reinicie o sistema se necessário.\033[0m"