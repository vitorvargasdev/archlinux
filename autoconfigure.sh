ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf

mkinitcpio -P
