#!/bin/bash

# 1. Update Fedora
echo "🚀 Updating Fedora..."
sudo dnf update -y

# 2. Install Hyprland & Required Modules
echo "📥 Installing Hyprland, Waybar, and all dependencies..."
sudo dnf install -y hyprland waybar kitty rofi-wayland swww swaylock swaync \
wlogout grim slurp wl-clipboard cliphist nwg-look qt5ct qt6ct libva-utils \
nm-connection-editor network-manager-applet pavucontrol bluez blueman \
gvfs gvfs-mtp btop brightnessctl playerctl python3-pip cava jq socat \
ImageMagick python3-requests sddm xdg-desktop-portal-hyprland dolphin

# 3. Create Symlinks (Connecting your repo to the system)
echo "🔗 Linking Regin Sam's Custom Dots..."
mkdir -p ~/.config

# This function backs up old folders and links yours
link_folder() {
    FOLDER=$1
    if [ -d "$HOME/.config/$FOLDER" ] && [ ! -L "$HOME/.config/$FOLDER" ]; then
        echo "⚠️ Backing up existing $FOLDER folder..."
        mv "$HOME/.config/$FOLDER" "$HOME/.config/${FOLDER}_backup"
    fi
    ln -sf "$HOME/dotfiles/$FOLDER" "$HOME/.config/$FOLDER"
    echo "✅ Linked $FOLDER"
}

# Link your folders
link_folder "hypr"
link_folder "waybar"

# 4. Final Font Refresh
echo "🔡 Refreshing fonts..."
fc-cache -fv

echo "✨ INSTALL COMPLETE! Logout and select Hyprland from the session menu."
