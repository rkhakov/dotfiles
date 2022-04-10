# Install Arch Linux

## Prepare an installation medium

```bash
dd bs=4M if=path-to/archlinux.iso of=/dev/sdx conv=fsync oflag=direct status=progress
```

## Verify the boot mode

```bash
ls /sys/firmware/efi/efivars
```

## Check internet connection

```bash
ping google.com

# if not internet
iwctl

[iwd]# device list

[iwd]# station device scan
# You can then list all available networks:

[iwd]# station device get-networks

# Finally, to connect to a network:
[iwd]# station device connect SSID
```

## Update the system clock

```bash
> timedatectl set-ntp true
# Check the service status
> timedatectl status
```

## Partition the disk

```bash
# list the partations
fdisk -l

# open the disk in fdisk
fdisk /dev/sda

# Create 3 partitions
# 1 - 550M EFI
# 2 - 2G SWAP
# 3 - * Remaining as Linux File System
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2314ecd8-a649-4c71-bed6-7b7d457b2110/Untitled.png)

## Format partitions

```bash
# format efi disk as fat32
mkfs.fat -F 32 /dev/{efi_system_partition}

# format swap partition
mkswap /dev/{swap-partation}
# make use of swap partation
swapon /dev/{swap-partation}

# Format Linux filesystem as ext4
mkfs.ext4 /dev/{root_partition}

# Example
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3
```

## Mount the file systems

```bash
# Mount the Linux filesystem to /mnt
mount /dev/{root_partition} /mnt
mount --mkdir /dev/{efi_system_partition} /mnt/boot

# Example
mount /dev/sda3 /mnt
mount --mkdir /dev/sda1 /mnt/boot
```

## Install essential packages

```bash
pacstrap /mnt base linux linux-firmware
```

## Configure the system

```bash
# Fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Check the fstab
vim /mnt/etc/fstab
```

## Change root

```bash
# change root into the new system
arch-chroot /mnt
```

## Set the locale and timezone

```bash
# ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
ln -sf /usr/share/zoneinfo/Asia/Yekateriburg /etc/localtime

hwclock --systohc

vim /etc/locale.gen # uncomment en_US.UTF-8 UTF-8

locale-gen # generate the locales

```

## Set hostname and host

```bash
echo myhostname >> /etc/hostname

vim /etc/hosts
127.0.0.1        localhost
::1              localhost
127.0.1.1        myhostname
```

## Set the root password

```bash
passwd
```

## Install GRUB

```bash
pacman -Sy grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/ --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

## Install Network Manager

```bash
pacman -S networkmanager network-manager-applet
systemctl enable NetworkManager
```
