tmux
date
mkfs.ext2 /dev/sda1
mkfs.ext4 -j /dev/sda2
mkfs.btrfs /dev/sda3
rm -r /mnt/gentoo/
mkdir /mnt/gentoo
mount -t ext4 /dev/sda2 /mnt/gentoo/
mkdir /mnt/gentoo/boot
mount -t ext2 /dev/sda1 /mnt/gentoo/boot
mkdir -p /mnt/gentoo/home/
mount -t btrfs /dev/sda3 /mnt/gentoo/home/
cd /mnt/gentoo/
wget http://gentoo.channelx.biz/releases/amd64/current-stage3/stage3-amd64-20130530.tar.bz2
tar xvjpf stage3-*.tar.bz2
wget http://gentoo.channelx.biz/snapshots/portage-latest.tar.bz2
tar xvjf portage-latest.tar.bz2 -C /mnt/gentoo/usr
rm stage3-*.tar.bz2* portage-latest.tar.bz2*
emacs /mnt/gentoo/etc/portage/make.conf
mount -t proc none /mnt/gentoo/proc
mount --rbind /dev /mnt/gentoo/dev
mount --rbind /sys /mnt/gentoo/sys
cp -L /etc/resolv.conf /mnt/gentoo/etc
chroot /mnt/gentoo /bin/bash
umount -l /mnt/gentoo{/dev{/shm,/pts},/sys,/usr,/home,/opt,/tmp,/var,/boot,/proc,/}
exit
