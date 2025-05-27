#!/bin/bash

# Update and install fun stuff first (for colored output)
echo -e "\e[1;35m[*] Installing fun stuff...\e[0m"
sudo apt update && sudo apt install -y figlet lolcat

# Display splash
figlet -f slant "Rathacker 3000" | lolcat

echo -e "\e[1;35m[*] Updating system packages...\e[0m" | lolcat
sudo apt update | lolcat
sudo apt upgrade -y | lolcat
sudo apt autoremove -y | lolcat

# Install essential packages
echo -e "\e[1;35m[*] Installing essential packages...\e[0m" | lolcat
sudo apt install -y zsh cmatrix fortune-mod cowsay neofetch | lolcat

# Clone the repo
if [ ! -d "$DEST_DIR" ]; then
    git clone "$GIT_REPO" "$DEST_DIR"
else
    echo -e "\e[1;33m[!] Repo already exists, pulling latest...\e[0m" | lolcat
    git -C "$DEST_DIR" pull
fi

# Copy the .zshrc to home directory
cp "$DEST_DIR/.zshrc" "$HOME/.zshrc"

# Set Zsh as default shell
chsh -s $(which zsh)

# Apply changes
source ~/.zshrc

echo -e "\n\e[1;32m✅ Zsh environment restored successfully!\e[0m" | lolcat
echo -e "\e[1;36m🚀 Run \`zsh\` or reboot to start using it.\e[0m" | lolcat