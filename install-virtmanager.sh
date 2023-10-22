pacman -Syu --noconfirm --needed qemu-full virt-manager dnsmasq libvirt iptables dhcpcd netctl

systemctl start  virtqemud
systemctl enable virtqemud
systemctl start virtnetworkd
systemctl enable libvirtd.socket
systemctl start virtstoraged