#!/bin/bash

# Installer sddm et qt6-svg
sudo pacman -S sddm qt6-svg

# Cloner le dépôt du thème SDDM
sudo git clone https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme

# Copier les polices dans le répertoire des polices
sudo cp /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/

# Éditer le fichier de configuration SDDM
echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf

# Optionnel : Mettre à jour le cache des polices
sudo fc-cache -fv

