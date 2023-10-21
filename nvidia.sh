
# Nvidia
pacman -Syu --noconfirm --needed nvidia nvidia-lts nvidia-utils nvidia-settings opencl-nvidia xorg-server-devel virtualgl

mkdir -p /etc/X11/xorg.conf.d

cat >> /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf<<EOF
Section "OutputClass"
    Identifier "intel"
    MatchDriver "i915"
    Driver "modesetting"
EndSection

Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
    Option "PrimaryGPU" "yes"
    ModulePath "/usr/lib/nvidia/xorg"
    ModulePath "/usr/lib/xorg/modules"
EndSection
EOF

mkdir -p /usr/share/gdm/greeter/autostart
mkdir -p /etc/xdg/autostart

cat >> /usr/share/gdm/greeter/autostart/optimus.desktop<<EOF
[Desktop Entry]
Type=Application
Name=Optimus
Exec=sh -c "xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto"
NoDisplay=true
X-GNOME-Autostart-Phase=DisplayServer
EOF

cat >> /etc/xdg/autostart/optimus.desktop<<EOF
[Desktop Entry]
Type=Application
Name=Optimus
Exec=sh -c "xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto"
NoDisplay=true
X-GNOME-Autostart-Phase=DisplayServer
EOF

# mkdir -p /etc/modprobe.d/nvidia-drm-nomodeset.conf
mkdir -p /etc/modprobe.d

cat >> /etc/modprobe.d/nvidia-drm-nomodeset.conf<<EOF
options nvidia-drm modeset=1
EOF

mkinitcpio -P