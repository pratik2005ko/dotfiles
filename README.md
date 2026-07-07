# prateek's dotfiles

Hyprland (Lua) · Quickshell · Kitty · NVim · ZSH

## Setup

```bash
# Clone
git clone https://github.com/pratik2005ko/dotfiles.git ~/dotfiles
cd ~/dotfiles

# One-command setup
bash scripts/setup.sh
```

Or manually:

```bash
# Configs (symlink)
for d in hypr kitty quickshell fastfetch cava btop nvim starship gtk-3.0 systemd; do
  ln -sf ~/dotfiles/config/$d ~/.config/$d
done

# Shell
ln -sf ~/dotfiles/home/.zshrc ~/.zshrc
ln -sf ~/dotfiles/home/.p10k.zsh ~/.p10k.zsh

# Scripts
chmod +x ~/dotfiles/scripts/*
mkdir -p ~/.local/bin
ln -sf ~/dotfiles/scripts/* ~/.local/bin/

# Zinit plugins
bash ~/dotfiles/scripts/setup-zinit.sh

# Systemd services
systemctl --user enable nexex.service hyprpolkitagent.service

# Cursor theme
yay -S bibata-cursor-theme-bin
hyprctl setcursor Bibata-Modern-Classic 24
```

## What's inside

| Directory | What |
|-----------|------|
| `config/hypr/` | Hyprland Lua config, hyprlock, hyprpaper, shaders |
| `config/kitty/` | Kitty terminal |
| `config/quickshell/` | Tide Island / nexex theme |
| `config/fastfetch/` | System fetch |
| `config/cava/` | Audio visualizer |
| `config/nvim/` | Neovim (LazyVim) |
| `config/systemd/user/` | nexex.service, hyprpolkitagent.service |
| `scripts/` | Toggle shader, gaps, eink, touchpad, screenshot, setup |
| `home/` | `.zshrc` (with zinit plugins), `.p10k.zsh` |

## Keybinds

| Key | Action |
|-----|--------|
| `Super + Q` | Kitty terminal |
| `Super + E` | Dolphin file manager |
| `Super + L` | Hyprlock |
| `Super + C` | Close window |
| `Super + V` | Toggle float |
| `Super + 1-0` | Switch workspace |
| `Super + Shift + 1-0` | Move window to workspace |
| `Super + S` | Scratchpad (special workspace) |
| `Super + B` | Toggle blue light shader |
| `Alt + B` | Toggle e-ink shader |
| `Super + G` | Toggle gaps |
| `Super + P` | OCR screen |
| `Super + F1` | Toggle touchpad |
| `Print` | Full screenshot |
| `Shift + Print` | Region screenshot |
| `Alt + Space` | App launcher (spotlight) |
| `Super + F` | Toggle spotlight |

## Shaders

- `blue-light-filter.glsl` — blue light filter (toggle with `Super + B`)
- `eink.glsl` — e-ink/paper effect (toggle with `Alt + B`)
