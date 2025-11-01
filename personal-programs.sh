sudo pacman -S --noconfirm --needed git


git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -sri --noconfirm

sudo pacman -S --noconfirm --needed \
    flatpak \
    dbeaver \
    docker \
    docker-compose \
    bitwarden \
    go \
    mariadb-clients \
    telegram-desktop \
    wezterm \
    zsh

systemctl enable docker

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.discordapp.Discord
flatpak install flathub com.transmissionbt.Transmission
