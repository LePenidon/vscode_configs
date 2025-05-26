#!/bin/bash

# ----------------------------------------------------------------------------
# CONFIGURAÇÕES PÓS-INSTALAÇÃO LINUX MINT 21.3 CINNAMON - MODO BASH
# ----------------------------------------------------------------------------
# Como usar:
#   1. Copie todo este conteúdo e salve em um arquivo (ex: `linux_configs.sh`)
#   2. Abra o terminal no diretório do arquivo e execute:
#      bash init.sh
# ----------------------------------------------------------------------------

echo -e "\n\033[1;32m=== INICIANDO CONFIGURAÇÕES PÓS-INSTALAÇÃO ===\033[0m\n"

# [1] ATUALIZAR SISTEMA
echo -e "\033[1;34m[1/8] Atualizando o sistema...\033[0m"
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y software-properties-common

# [2] INSTALAR DRIVERS (se necessário)
echo -e "\033[1;34m[2/8] Instalando drivers proprietários...\033[0m"
sudo ubuntu-drivers autoinstall

# [3] OTIMIZAR PARA SSD/HD
echo -e "\033[1;34m[3/8] Aplicando otimizações de disco...\033[0m"
sudo systemctl enable fstrim.timer --now  # TRIM para SSD
if lsblk -d -o rota | grep -q "0"; then
    echo "deadline" | sudo tee /sys/block/sda/queue/scheduler > /dev/null  # SSD
else
    echo "bfq" | sudo tee /sys/block/sda/queue/scheduler > /dev/null       # HD
fi
# Reduzir swappiness se RAM >= 8GB
if [ $(free -g | awk '/Mem:/ {print $2}') -ge 8 ]; then
    echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
fi

# [4] INSTALAR PACOTES ÚTEIS
echo -e "\033[1;34m[4/8] Instalando pacotes essenciais...\033[0m"
sudo apt install -y \
    vlc gimp flameshot timeshift gnome-disk-utility \
    git neofetch tlp tlp-rdw ubuntu-restricted-extras \
    libavcodec-extra flatpak

# [5] CONFIGURAR FLATPAK
echo -e "\033[1;34m[5/8] Configurando Flatpak...\033[0m"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# [6] ATIVAR FIREWALL
echo -e "\033[1;34m[6/8] Habilitando firewall...\033[0m"
sudo ufw enable
sudo ufw default deny incoming

# [7] CRIAR BACKUP INICIAL (TIMESHIFT)
echo -e "\033[1;34m[7/8] Criando backup inicial com Timeshift...\033[0m"
sudo timeshift --create --comments "Backup pós-instalação" --tags D

# [8] PERSONALIZAR CINNAMON
echo -e "\033[1;34m[8/8] Aplicando personalizações...\033[0m"
gsettings set org.cinnamon.theme name "Mint-Y-Dark"
gsettings set org.cinnamon.desktop.keybindings.wm maximize "['<Super>Up']"

# [9] EXECUTANDO COMANDOS ADICIONAIS
echo -e "\033[1;34m[9/9] Executando comandos adicionais...\033[0m"

flatpak install flathub com.brave.Browser
flatpak install flathub com.stremio.Stremio
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.brave.Browser
flatpak install flathub com.spotify.Client

# FINALIZAÇÃO
echo -e "\n\033[1;32m=== CONCLUÍDO! ===\033[0m"
echo -e "Recomendações:\n1. Reinicie o sistema.\n2. Use 'flatpak install' para apps adicionais.\n3. Configure o Timeshift para backups automáticos.\n"
neofetch