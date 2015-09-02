#!/bin/sh
#script -a install_`date +%Y-%m-%d-%H:%M:%S`.log
sudo ufw status verbose
sudo ufw enable
sudo ufw default deny
sudo add-apt-repository ppa:japaneseteam/ppa
sudo add-apt-repository ppa:tuxpoldo/btsync
sudo add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora
###http://orebibou.com/2014/10/apt-get%E3%82%92%E3%82%88%E3%82%8A%E9%AB%98%E9%80%9F%E3%81%AB%EF%BC%81%E3%80%8Eapt-fast%E3%80%8F%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89/
###https://github.com/ilikenwf/apt-fast
sudo add-apt-repository ppa:saiarcot895/myppa
#wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
#wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
#sudo wget https://www.ubuntulinux.jp/sources.list.d/vivid.list -O /etc/apt/sources.list.d/ubuntu-ja.list
#wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
#wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
#sudo wget https://www.ubuntulinux.jp/sources.list.d/trusty.list -O /etc/apt/sources.list.d/ubuntu-ja.list
sudo apt-get purge unity-scope-* unity-lens-video unity-scope-video-remote unity-lens-music unity-lens-photos -y
sudo apt-get update ; sudo apt-get dist-upgrade -y
#sudo apt-get install aptitude aria2 byobu curl emacs24-nox stunnel4 mew mew-bin ca-certificates emacs-mozc fbterm fcitx-mozc fish flashplugin-installer gdisk git-core git-doc git-gui git-svn gparted hdparm htop procps glances kate kde-baseapps kde-base-artwork kde-config-fcitx kde-l10n-ja ktorrent language-pack-kde-ja language-pack-gnome-ja libfcitx-qt5-1 mozc-server mozc-utils-gui openssh-client parted smartmontools tmux ufw unzip unrar uim-fep uim-xim vim-nox virtualbox vlc xclip wine fish 
sudo apt-get install apt-fast aria2
sudo wget https://raw.githubusercontent.com/neplus/config/master/etc/apt-fast.conf -O /etc/apt-fast.conf
sudo apt-fast install kubuntu-desktop aptitude aria2 apt-btrfs-snapshot bleachbit btrfs-tools btsync build-essential byobu ca-certificates chkrootkit comix curl docker.io vim-syntax-docker emacs24-nox emacs-mozc fbterm fcitx-mozc fish flashplugin-installer fonts-inconsolata fonts-takao gdisk git-core git-doc git-gui git-svn glances gparted haskell-platform hdparm htop krita jhead procps glances kate kde-baseapps kde-base-artwork kde-l10n-ja keepass2 ktorrent language-pack-kde-ja language-pack-gnome-ja lib32z1 lib32ncurses5 lib32nss-mdns libdigest-whirlpool-perl libvirt-bin lm-sensors lynx mew mew-bin mozc-server mozc-utils-gui openjdk-7-jdk openssh-client p7zip-rar p7zip-full parted prelink preload privoxy procps pwgen python-software-properties qemu-kvm rsync smartmontools stunnel4 testdisk tmux tor tree ubuntu-restricted-extras ufw unzip unrar uim-fep uim-xim vagrant vidalia vim-nox  virt-manager virtualbox vlc xclip wine zram-config -y
#rkhunter
#aptitude aria2 apt-btrfs-snapshot btrfs-tools btsync build-essential byobu ca-certificates curl emacs24-nox emacs-mozc fbterm fcitx-mozc fish flashplugin-installer gdisk git-core git-doc git-gui git-svn glances gparted hdparm htop jhead procps glances kate kde-baseapps kde-base-artwork kde-l10n-ja ktorrent language-pack-kde-ja language-pack-gnome-ja libfcitx-qt5-1 lib32z1 lib32ncurses5 lib32bz2-1.0 lib32nss-mdns libdigest-whirlpool-perl libvirt-bin lm-sensors mew mew-bin mozc-server mozc-utils-gui openjdk-7-jdk openssh-client p7zip-rar p7zip-full parted prelink preload procps qemu-kvm smartmontools stunnel4 testdisk tmux ubuntu-restricted-extras ufw unzip unrar uim-fep uim-xim vim-nox  virt-manager virtualbox vlc xclip wine zram-config
sudo apt-get update ; sudo apt-get dist-upgrade -y
#sudo apt-get purge dragonplayer kwalletmanager
sudo apt-get purge dragonplayer seahorse kwalletmanager totem cheese evolution-data-server-common evolution-data-server-online-accounts -y
sudo apt-get autoclean
#LANG=C; xdg-user-dirs-gtk-update
#LANG=C xdg-user-dirs-update --force
LANG=ja_JP.UTF-8 ; export LANG
#LANG=en_US.UTF-8 ; export LANG
sudo add-apt-repository ppa:ubuntu-clamav/ppa
sudo apt-get install clamav clamav-daemon clamav-freshclam clamfs libclamunrar6 -y
sudo freshclam
cd /etc/init.d/
sudo /etc/init.d/clamav-daemon start
sudo /etc/init.d/clamav-freshclam
ps aux | grep clamav
#sudo freshclam -d -c 24
#sudo less -f /var/log/clamav/freshclam.log
###http://ubuntufreak.net/set/security-set2.html
cd /usr/share/doc/clamfs/
sudo gzip -d /usr/share/doc/clamfs/clamfs-sample.xml.gz
sudo cp /usr/share/doc/clamfs/clamfs-sample.xml /etc/clamfs.xml
sudo mkdir -p /usr/share/doc/clamfs//clamfs/tmp
sudo clamfs /etc/clamfs.xml
cd /etc
sudo cp /etc/clamfs.xml /etc/clamfs_home.xml
sudo mkdir -p /etc/clamfs/home
sudo clamfs /etc/clamfs_home.xml
## freshclam and make ramdisk
sudo wget https://raw.githubusercontent.com/neplus/config/master/etc/rc.local -O /etc/rc.local
sudo mkdir /ramdisk
sudo chmod 770 /ramdisk
#chmod 777 /ramdisk;echo /dev/shm /ramdisk   tmpfs   size=8g 0   0 >> /etc/fstab;
#sudo nano /etc/fstab
###http://www.atmarkit.co.jp/flinux/rensai/linuxtips/930clamavdbup.html
#crontab -e
#59 * * * * clamav /usr/bin/freshclam -l /var/log/clamav/freshclam.log
#30 * * * * clamav /usr/bin/freshclam --quiet -l /var/log/freshclam.log
sudo wget https://raw.githubusercontent.com/neplus/config/master/etc/crontab -O /etc/crontab
crontab -l
sudo /etc/init.d/cron restart
####Keepass2
#####http://cloverrose.hateblo.jp/entry/2013/04/23/105443 http://synclogue-navi.com/keepass-install
cd ~/
aria2c http://downloads.sourceforge.net/keepass/KeePass-2.30-Japanese.zip
unzip KeePass*.zip
sudo rsync -varshz Japanese.lngx /usr/lib/keepass2/
###Tor and privoxy
wget https://raw.githubusercontent.com/neplus/config/master/.bashrc -O ~/.bashrc
sudo wget https://raw.githubusercontent.com/neplus/config/master/etc/privoxy/config -O /etc/privoxy/config
sudo cat /etc/privoxy/config
sudo service tor restart
sudo service privoxy restart
sudo update-rc.d tor enable
sudo update-rc.d privoxy enable
##btsync
mkdir -p ~/0/0btsync
sudo apt-get install btsync
sudo chmod 775 ~/0/0btsync
sudo chown neplus:btsync ~/0/0btsync
##googlechrome
aria2c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
wget https://raw.github.com/neplus/config/master/.xmodmap ~/.xmodmap
xmodmap ~/.xmodmap
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo xmodmap ~/.xmodmap >> ~/.xinitrc
echo xmodmap ~/.xmodmap >> ~/.xsessionrc
alias sechrome="google-chrome-stable --incognito --disable-background-mode --disk-cache-size=1 --disk-cache-size=1 --enable-click-to-play --disable-geolocation --enable-desktop-notifications"
alias chrome="google-chrome-stable --disable-background-mode --disk-cache-size=1 --disk-cache-size=1 --enable-click-to-play --disable-geolocation --enable-desktop-notifications"
LANG=C; xdg-user-dirs-gtk-update
echo $SHELL
#sudo apt-get install fish
wget https://raw.githubusercontent.com/neplus/config/master/.config/fish/config.fish -O ~/.config/fish/config.fish
fish --version
which fish
chsh -s /usr/bin/fish
#chsh -s /usr/bin/fish
#exit
#im-config

#不要カーネル削除
#sudo apt-get update;sudo apt-get dist-upgrade -y
#sudo apt-get autoremove
#bash
#dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
#fish
