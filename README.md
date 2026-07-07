# prateek's dotfiles

Hyprland (Lua) · Quickshell · Kitty · NVim · ZSH

## Setup

```bash
# Clone
git clone https://github.com/pratik2005ko/dotfiles.git ~/dotfiles

# Configs (symlink)
ln -sf ~/dotfiles/config/hypr ~/.config/hypr
ln -sf ~/dotfiles/config/kitty ~/.config/kitty
ln -sf ~/dotfiles/config/quickshell ~/.config/quickshell
ln -sf ~/dotfiles/config/fastfetch ~/.config/fastfetch
ln -sf ~/dotfiles/config/cava ~/.config/cava
ln -sf ~/dotfiles/config/btop ~/.config/btop
ln -sf ~/dotfiles/config/nvim ~/.config/nvim
ln -sf ~/dotfiles/config/starship ~/.config/starship
ln -sf ~/dotfiles/config/gtk-3.0 ~/.config/gtk-3.0

# Shell
ln -sf ~/dotfiles/home/.zshrc ~/.zshrc
ln -sf ~/dotfiles/home/.p10k.zsh ~/.p10k.zsh

# Scripts
chmod +x ~/dotfiles/scripts/*
mkdir -p ~/.local/bin
ln -sf ~/dotfiles/scripts/* ~/.local/bin/
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
| `scripts/` | Toggle shader, gaps, eink, touchpad, screenshot, etc. |
| `home/` | `.zshrc`, `.p10k.zsh` |

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
