#!/bin/bash
set -e

echo "==> Linking configs..."
ln -sf "$PWD/config/hypr" ~/.config/hypr
ln -sf "$PWD/config/kitty" ~/.config/kitty
ln -sf "$PWD/config/quickshell" ~/.config/quickshell
ln -sf "$PWD/config/fastfetch" ~/.config/fastfetch
ln -sf "$PWD/config/cava" ~/.config/cava
ln -sf "$PWD/config/btop" ~/.config/btop
ln -sf "$PWD/config/nvim" ~/.config/nvim
ln -sf "$PWD/config/starship" ~/.config/starship
ln -sf "$PWD/config/gtk-3.0" ~/.config/gtk-3.0
ln -sf "$PWD/config/systemd" ~/.config/systemd

echo "==> Linking scripts..."
chmod +x "$PWD/scripts/"*.sh
mkdir -p ~/.local/bin
for f in "$PWD/scripts/"*; do
  [ -f "$f" ] && ln -sf "$f" ~/.local/bin/
done

echo "==> Linking home files..."
ln -sf "$PWD/home/.zshrc" ~/.zshrc
ln -sf "$PWD/home/.p10k.zsh" ~/.p10k.zsh

echo "==> Installing Zinit..."
bash "$PWD/scripts/setup-zinit.sh"

echo "==> Enabling systemd services..."
systemctl --user enable nexex.service
systemctl --user enable hyprpolkitagent.service

echo "==> Cursor theme (Bibata-Modern-Classic)"
echo "Install via: yay -S bibata-cursor-theme-bin"
echo "Set cursor: hyprctl setcursor Bibata-Modern-Classic 24"

echo ""
echo "Done! Reboot or restart Hyprland."
