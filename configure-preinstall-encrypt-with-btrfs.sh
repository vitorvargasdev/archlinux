volumeBoot="/dev/nvme0n1p1"
volumeRoot="/dev/nvme0n1p2"
cryptName="crypt"
cryptRoot="/dev/mapper/${cryptName}"

baseSystem="base base-devel linux linux-headers linux-firmware nano git reflector"

# Preconfigure your volumes with F32 and BTRFS
pacman -Sy --noconfirm archlinux-keyring

pacman-key --init && pacman-key --populate

mkfs.fat -F32 $volumeBoot

cryptsetup luksFormat --use-random -S 1 -s 512 -h sha512 $volumeRoot
cryptsetup open $volumeRoot $cryptName
mkfs.btrfs $cryptRoot -f
mount $cryptRoot /mnt
cd /mnt
btrfs subvolume create @
btrfs subvolume create @home
btrfs subvolume create @snapshots
cd
umount -R /mnt
mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@ $cryptRoot /mnt

mkdir /mnt/home
mkdir /mnt/.snapshots
mkdir /mnt/boot

mount -t btrfs -o defaults,x-mount.mkdir,noatime,compress=zstd,space_cache=v2,discard=async,subvol=@home $cryptRoot /mnt/home
mount -t btrfs -o defaults,x-mount.mkdir,noatime,compress=zstd,space_cache=v2,discard=async,subvol=@snapshots $cryptRoot /mnt/.snapshots

mount $volumeBoot /mnt/boot

pacstrap -K /mnt $baseSystem

genfstab -U /mnt > /mnt/etc/fstab

arch-chroot /mnt