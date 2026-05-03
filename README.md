# Apajadah's niri-dotfiles
![Niri](https://img.shields.io/badge/Niri-D55C44?style=for-the-badge&logo=niri&logoColor=white&color=%23D55C44)
![Wayland](https://img.shields.io/badge/Wayland-FFBC00?style=for-the-badge&logo=wayland&logoColor=black&color=%23FFBC00)
![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?style=for-the-badge&logo=archlinux&logoColor=white&color=%231793D1)

Simple, readable, and productive setup.

Inspired by [Catppuccin](https://catppuccin.com/)'s color palette, just tad bit of personal touches with brighter colors and less jaring background color.

## Screenshots

<details open>
  <summary>Blank desktop with SwayNC and Rofi opened</summary>
  <img width="1920" height="1080" alt="An image showing a blank desktop with SwayNotificationCenter and rofi opened" src="https://github.com/user-attachments/assets/0299931c-6899-4901-8b65-2a055b22ce2f" />
</details>

<details>
  <summary>Lockscreen</summary>
  <img width="1920" height="1080" alt="Lockscreen" src="https://github.com/user-attachments/assets/f04c308e-f24f-4b60-a053-8185d12b6b0f" />
</details>

<details>
  <summary>Wlogout</summary>
  <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/60e71457-fcc8-495b-88f1-b73ed8e20640" />
</details>

## Installation
> [!NOTE]
> Since this is only for personal use, i will be only focusing on Arch Linux.
> 
> If you want to use this, adjust accordingly to your distro of choice. Look out for [systemd-timer](configs/systemd/user) if you're using a systemd-less distro, this timer is on the user level.

These are the packages for this dotfile:
```bash
pacman -S niri awww rofi rofi-calc rofi-emoji waybar swayosd swaync hyprlock hypridle # Required
pacman -S wbg cava fastfetch fish foot neovim # Optional, some needs extra configuration
yay -S wlogout # Or use your favorite AUR helper
```

To use this dotfiles, you can clone this repo and move the directory accordingly
```bash
git clone https://github.com/KLevnDarama/niri-dotfiles/ --depth 1
cd niri-dotfiles/

mkdir ~/.config
mv configs/ ~/.config

mkdir ~/.local/
mkdir ~/.local/bin
mv bin/ ~/.local/bin
```

For the fonts, you may install:
- `ttf-firacode-nerd` package or manually via [the website](https://www.nerdfonts.com/) and look for "FiraCode"
- "Stray (2022)" font from [this video](https://www.youtube.com/watch?v=Gnx4XUvEd44). 

After that, you can put the fonts in the `/usr/share/fonts/` directory for global installation or `~/.local/share/fonts` for user-specific installation.

Run `fc-cache -fr` to refresh the font cache.

