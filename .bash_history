hwclock --debug
hwclock --adjust
ntpdate -vbs ntp.nict.jp
hwclock --systohc
parted /dev/sda
mkfs.ext2 /dev/sda1
mkfs.ext4 -j /dev/sda5
mkfs.ext4 -j /dev/sda6
mkswap /dev/sda7
rm -r /mnt/gentoo/
mkdir /mnt/gentoo
mount -t ext4 /dev/sda5 /mnt/gentoo/
mkdir /mnt/gentoo/boot
mount -t ext2 /dev/sda1 /mnt/gentoo/boot
mkdir -p /mnt/gentoo/home/
mount -t btrfs /dev/sda6 /mnt/gentoo/home/
swapon /dev/sda7
cd /mnt/gentoo/
wget http://gentoo.channelx.biz/releases/amd64/current-stage3/stage3-amd64-20130627.tar.bz2
tar xvjpf stage3-*.tar.bz2
wget http://gentoo.channelx.biz/snapshots/portage-latest.tar.bz2
tar xvjf portage-latest.tar.bz2 -C /mnt/gentoo/usr
rm stage3-*.tar.bz2* portage-latest.tar.bz2*
wget https://raw.github.com/bleuscr/config/master/etc/portage/make.conf -O /mnt/gentoo/etc/portage/make.conf
nano -w /mnt/gentoo/etc/portage/make.conf
mount -t proc none /mnt/gentoo/proc
mount --rbind /dev /mnt/gentoo/dev
mount --rbind /sys /mnt/gentoo/sys
cp -L /etc/resolv.conf /mnt/gentoo/etc
chroot /mnt/gentoo /bin/bash
umount -l /mnt/gentoo{/sys,/home,/boot,/proc,/}
exit
