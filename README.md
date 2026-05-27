<img width="1386" height="508" alt="image" src="https://github.com/user-attachments/assets/857a7225-6a0f-4f7f-9eff-5c5242eb40ef" /># Apajadah's niri-dotfiles

![Niri](https://img.shields.io/badge/Niri-D55C44?style=for-the-badge&logo=niri&logoColor=white&color=%23D55C44)
![Wayland](https://img.shields.io/badge/Wayland-FFBC00?style=for-the-badge&logo=wayland&logoColor=black&color=%23FFBC00)
![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?style=for-the-badge&logo=archlinux&logoColor=white&color=%231793D1)

Simple, readable, and productive setup.

Inspired by [Catppuccin](https://catppuccin.com/)'s color palette,
just tad bit of personal touches with brighter colors and less jaring background color.

## Screenshots

<details open>
  <summary>Blank desktop with SwayNC and Rofi opened</summary>
  <img width="1920" height="1080" alt="An image showing a blank desktop with SwayNotificationCenter and rofi opened" src="https://github.com/user-attachments/assets/0299931c-6899-4901-8b65-2a055b22ce2f" />
</details>

<details>
  <summary>Lock screen</summary>
  <img width="1920" height="1080" alt="Lockscreen" src="https://github.com/user-attachments/assets/f04c308e-f24f-4b60-a053-8185d12b6b0f" />
</details>

<details>
  <summary>Rofi power menu</summary>
  <img width="1386" height="508" alt="Rofi power menu" src="https://github.com/user-attachments/assets/c119e863-4ca5-4cb1-8beb-c876ce766a67" />
</details>

## Installation

> [!IMPORTANT]
> This dotfile is made for personal use, i won't be adding instructions for other distributions but the process should be similar.
> Adjust accordingly to fit your distribution of choice.

### 1. Packages (Arch Linux)

These are the packages for this dotfile:

```bash
pacman -S niri awww rofi rofi-calc rofi-emoji waybar swayosd swaync hyprlock hypridle wbg bc # Required
pacman -S cava fastfetch fish foot # Optional, some needs extra configuration
```

### 2. Cloning and Moving

> [!CAUTION]
> Before moving files into the designated directories, make sure to backup ALL of your existing data as
> this is a destructive action with no prior warning.

To use this dotfiles, you can clone this repo and move the files accordingly:

```bash
git clone https://github.com/KLevnDarama/niri-dotfiles/ --depth 1
cd niri-dotfiles/

mkdir ~/.config
mv configs/ ~/.config

mkdir -p ~/.local/bin
mv bin/ ~/.local/bin

# udev rules requires root privileges
# More indo in a chapter down below
sudo cp udev/ /etc/udev/rules.d
```

The lock screen will look for `.face` in your `$HOME` directory. Consider cropping a profile picture into a 1:1 ratio and set the name as `.face`.

### 3. Fonts

For the fonts, you may need to install the following:

- `ttf-firacode-nerd` package or manually via [the website](https://www.nerdfonts.com/) and look for "FiraCode"
- "Stray (2022)" font from [this video](https://www.youtube.com/watch?v=Gnx4XUvEd44). 

After that, you can put the fonts in the `/usr/share/fonts/` directory for global installation
or `~/.local/share/fonts` for user-specific installation.

Run `fc-cache -fr` to refresh the font cache.

### 4. Set wallpaper

If you want to change wallpaper, use [setwall](bin/setwall) as the handler.
This will handle the background image and backdrop blurring. Persistent after reboot without aditional startup services
(handled by `awww-daemon` and `wbg` startup).

```bash
# Assuming you're in the same directory as 'setwall'
# cd ~/.local/bin

# Usage: ./setwall <image_path>
./setwall ~/Pictures/Wallpapers/mountains.png
```

### 5. Start timers and udev rules
You can follow this instruction if you're on a laptop or desktop with a functioning battery. Otherwise, skip this.

> [!WARNING]
> If you're the 0.1% of the people that has more than one battery device, this method is unsupported because i can't test it properly.
> Consider using other scripts that supports this.

> [!TIP]
> For non-systemd users, adjust accordingly to your init system of choice.
>
> The timer runs [battery-charging](bin/battery-charging) every 5 seconds.
> The `udev` rule checks your `power_supply` subsystem and runs [battery-alert](bin/battery-alert)
> with input `0` as unplugged and `1` as plugged in. 

If you do anything different for the [`bin`](bin/) directory, adjust the paths accordingly.

To start the `systemd-timer`, make sure the [timer and service](configs/systemd/user/) are placed in `~/.config/systemd/user/`.

```bash
# Confirm if battery-alert.* exists
ls ~/.config/systemd/user/
```

Activate `battery-alert.timer` on the user level, doesn't need root privileges.

```bash
systemctl enable --now --user battery-alert.timer
```

To start the `systemd-udevd` rules, make sure the [udev rules](udev/) are placed in `/etc/udev/rules.d`.

```bash
# If you haven't copied the udev rules, follow this instruction.
# udev rules requires root privileges
# sudo cp udev/ /etc/udev/rules.d/

# Confirm if *.rules exists
ls /etc/udev/rules.d/
```

The `udev` rules needs extra configurations. Inside the [99-powersupply.rules](udev/99-powersupply.rules),
theres a template `USER` that you need to change accordingly. Use your favorite code editor in `/etc/udev/rules.d/99-powersupply.rules` as root,
or run the following command:

```bash
# udev rules requires root privileges
sudo sed -i "s/USER/$(logname)/g" /etc/udev/rules.d/99-powersupply.rules
```

Run the following to reload `udev` rules:

```bash
# udevadm requires root privileges
sudo udevadm control --reload-rules && sudo udevadm trigger
```
