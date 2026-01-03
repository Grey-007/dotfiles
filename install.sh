#!/bin/bash
set -e

echo "==> Installing Hyprland theming stack (pywal + swww + GTK + Rofi)"

# -------------------------
# Pacman packages
# -------------------------
PACMAN_PKGS=(
  # Core theming
  python-pywal
  imagemagick
  swww

  # GTK theming
  gtk-engine-murrine
  sassc
  papirus-icon-theme
  papirus-folders

  # UI components
  rofi-wayland
  waybar
  dunst

  # Utilities
  jq
  xdg-user-dirs

  # phase 3
  zsh
  kitty
  starship
  zsh-autosuggestions
  zsh-syntax-highlighting

  # hyprlock and idle
  hyprlock 
  hypridle

  # scratch pad 
  qalculate-gtk
  ncspot
  obsidian

  # poweprofile
  power-profiles-daemon
  powertop
)

echo "==> Installing pacman packages..."
sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"

# -------------------------
# Ensure user dirs exist
# -------------------------
echo "==> Ensuring XDG user directories..."
xdg-user-dirs-update

# -------------------------
# AUR helper check
# -------------------------
if ! command -v yay >/dev/null 2>&1; then
  echo "ERROR: yay not found."
  echo "Install yay first, then re-run this script."
  exit 1
fi

# -------------------------
# AUR packages
# -------------------------
AUR_PKGS=(
  pywal-gtk-theme
)

echo "==> Installing AUR packages..."
yay -S --needed --noconfirm "${AUR_PKGS[@]}"

# -------------------------
# Directory structure
# -------------------------
echo "==> Creating required directories..."

mkdir -p ~/.config/hypr
mkdir -p ~/.config/wal/hooks
mkdir -p ~/.local/bin
mkdir -p ~/.themes
mkdir -p ~/.cache/wallpapers
mkdir -p ~/Wallpapers
mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.config/gtk-4.0

# -------------------------
# Permissions sanity
# -------------------------
chmod -R u+rwX ~/.config ~/.local || true

echo
echo "==> Done."
echo
echo "Next steps:"
echo "1. Ensure Hyprland configs are in ~/.config/hypr/"
echo "2. Run: setwall <image>"
echo "3. Open wallpicker with SUPER + W"
