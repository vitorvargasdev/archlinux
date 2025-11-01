volumeBoot="/dev/nvme0n1p1"
volumeRoot="/dev/nvme0n1p2"
cryptName="crypt"
cryptRoot="/dev/mapper/${cryptName}"

cryptsetup open $volumeRoot $cryptName
mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@ $cryptRoot /mnt
mount -t btrfs -o defaults,x-mount.mkdir,noatime,compress=zstd,space_cache=v2,discard=async,subvol=@home $cryptRoot /mnt/home
mount -t btrfs -o defaults,x-mount.mkdir,noatime,compress=zstd,space_cache=v2,discard=async,subvol=@snapshots $cryptRoot /mnt/.snapshots

mount $volumeBoot /mnt/boot

genfstab -U /mnt > /mnt/etc/fstab

arch-chroot /mnt
