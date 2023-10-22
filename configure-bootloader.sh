volumeBoot=/boot/
volumeRoot=/dev/nvme0n1p2
cryptName=crypt
cryptRoot="/dev/mapper/${cryptName}"

cryptUuid=$(blkid -s UUID -o value $volumeRoot)

bootctl --path=$volumeBoot install

cat > /boot/loader/loader.conf<<EOF
default arch

timeout 3
editor 0
#console-mode keep
EOF

cat > /boot/loader/entries/arch.conf<<EOF
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img

options cryptdevice=UUID=$cryptUuid:crypt root=$cryptRoot rootflags=subvol=@ quiet rw
EOF
