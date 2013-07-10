time emerge --sync
time emerge -uDN world
useradd -m -g users -G wheel -s /bin/zsh hogehoge
passwd hogehoge
visudo
wget https://raw.github.com/bleuscr/config/master/etc/sudoers
time emerge -tav xorg-x11 kdebase-startkde kcontrol kscreen kde-l10n xrandr mozc ibus-qt ricty --autounmask-write
dispatch-conf
nano -w /etc/conf.d/xdm
rc-update add xdm default
echo "exec startkde" > ~/.xinitrc
startx
nano -w
wget https://raw.github.com/bleuscr/config/master/etc/X11/xinit/xinput.d/.ibus
wget https://raw.github.com/bleuscr/config/master/etc/X11/xinit/xinitrc
wget https://raw.github.com/bleuscr/config/master/etc/X11/xinit/xinputrc
wget https://raw.github.com/bleuscr/config/master/etc/X11/xinit/xserverrc
wget https://raw.github.com/bleuscr/config/master/etc/X11/Xsession
wget https://raw.github.com/bleuscr/config/master/etc/X11/Xsession.options
wget https://raw.github.com/bleuscr/config/master/etc/X11/Xwrapper.config
wget https://raw.github.com/bleuscr/config/master/etc/X11/default-display-manager
time emerge -tav man-pages-ja groff eix portage-utils layman flaggie lightdm-kde --autounmask-write
time emerge -tav kdm uim ja-ipafonts mix-mplus-ipa monafont ipamonafont vlgothic sakura tilda --autounmask-write
time emerge -tav xfce4-terminal qterminal vlc google-chrome icedtea dev-lang/scala scala-mode --autounmask-write
time emerge -tav sys-apps/dbus --autounmask-write
mkdir /mnt/ramdisk
mount -t tmpfs -o size=6g /dev/shm /mnt/ramdisk
nano -w /etc/rc.local
wget https://raw.github.com/bleuscr/config/master/etc/rc.local -O /etc/rc.local
time emerge -uDN world
nano -w /etc/ssh/sshd_config
wget https://raw.github.com/bleuscr/config/master/etc/ssh/sshd_config -O /etc/ssh/sshd_config
netstat -lnp
xclip -sel clip < /var/log/portage/elog/summary.log
