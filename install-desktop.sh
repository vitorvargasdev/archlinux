pacman -Syu --noconfirm --needed reflector

reflector -c Brazil -a 6 --sort rate > /etc/pacman.d/mirrorlist

# Gnome Complete desktop
pacman -Syu --noconfirm --needed \
    xorg \
    xorg-server \
    gnome \
    gnome-desktop \
    netctl \
    linux-firmware \
    linux \
    linux-lts \
    linux-headers \
    linux-lts-headers \
    sudo \
    iw \
    iwd \
    mesa \
    mesa-utils \
    neofetch \
    networkmanager \
    otf-ipafont \
    ttf-fira-code \
    woff-fira-code \
    woff2-fira-code \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    adobe-source-code-pro-fonts \
    adobe-source-sans-fonts \
    adobe-source-serif-fonts \
    ttf-liberation \
    ttf-dejavu \
    ttf-roboto \
    pipewire-pulse \
    pavucontrol \
    timeshift \
    wget \
    wayland \
    wpa_supplicant \
    wireless_tools \
    vlc \
    power-profiles-daemon \
    qalculate-gtk \
    nano \
    mtools \
    gnome-weather \
    gnome-tweaks \
    gnome-themes-extra \
    gnome-shell-extension-appindicator \
    gnome-shell-extensions \
    fuse2 \
    efibootmgr \
    grub \
    git \
    dnsmasq \
    dialog \
    arch-install-scripts \
    amd-ucode \
    alacarte \
    nautilus \
    zsh \
    dosfstools

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable gdm
