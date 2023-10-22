sudo pacman -S --noconfirm --needed git

git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -sri --noconfirm

yay -S pamac-all libpamac-full spotify-adblock pamac-cli visual-studio-code-insiders-bin chrome-gnome-shell --noconfirm

sudo pacman -S --noconfirm --needed \
    flatpak \
    dbeaver \
    docker \
    docker-compose \
    bitwarden \
    go \
    mariadb-clients \
    telegram-desktop \
    tor

systemctl enable docker
systemctl enable tor

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.discordapp.Discord
flatpak install flathub com.slack.Slack
flatpak install flathub com.transmissionbt.Transmission
flatpak install flathub io.github.mimbrero.WhatsAppDesktop
