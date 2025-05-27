#!/bin/bash

# === Rat Shell Setup Script ===
# Installs zsh config and fun tools, sets zsh as default shell

GIT_REPO="https://github.com/Ratstopher/ratshell.git"
DEST_DIR="$HOME/.config/zsh-setup"

# --- Locale Fix (Optional but useful for WSL and Ubuntu)
echo -e "\e[1;35m[*] Fixing locale issues (if any)...\e[0m"
sudo apt update && sudo apt install -y locales
sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# --- Install lolcat and figlet first for visual flair
echo -e "\e[1;35m[*] Installing fun stuff...\e[0m"
sudo apt install -y figlet lolcat
figlet -f slant "Ratputer 3000" | lolcat

# --- System Update
echo -e "\e[1;35m[*] Updating system packages...\e[0m" | lolcat
sudo apt update | lolcat
sudo apt upgrade -y | lolcat
sudo apt autoremove -y | lolcat

# --- Install core tools
echo -e "\e[1;35m[*] Installing essential packages...\e[0m" | lolcat
sudo apt install -y zsh cmatrix fortune-mod cowsay neofetch | lolcat

# --- Clone or update your zsh config repo
if [ ! -d "$DEST_DIR" ]; then
    echo -e "\e[1;35m[*] Cloning zsh config repo...\e[0m"
    git clone "$GIT_REPO" "$DEST_DIR"
else
    echo -e "\e[1;33m[!] Repo already exists. Pulling latest changes...\e[0m"
    git -C "$DEST_DIR" pull
fi

# --- Copy .zshrc into place
if [ -f "$DEST_DIR/.zshrc" ]; then
    cp "$DEST_DIR/.zshrc" "$HOME/.zshrc"
    echo -e "\e[1;32m[+] .zshrc copied to home directory.\e[0m"
else
    echo -e "\e[1;31m[!] .zshrc not found in repo!\e[0m"
    exit 1
fi

# --- Set Zsh as the default shell
chsh -s $(which zsh)

# --- Finish
echo -e "\n\e[1;32m✅ Zsh environment restored successfully!\e[0m"
echo -e "\e[1;36m🚀 Run \`zsh\` or reboot to start using it.\e[0m"