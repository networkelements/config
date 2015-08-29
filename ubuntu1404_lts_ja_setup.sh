#!/bin/sh
#script -a install_`date +%Y-%m-%d-%H:%M:%S`.log
sudo ufw status verbose
sudo ufw enable
sudo ufw default deny
sudo add-apt-repository ppa:japaneseteam/ppa
sudo add-apt-repository ppa:tuxpoldo/btsync
sudo add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora
#wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
#wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
#sudo wget https://www.ubuntulinux.jp/sources.list.d/vivid.list -O /etc/apt/sources.list.d/ubuntu-ja.list
#wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
#wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
#sudo wget https://www.ubuntulinux.jp/sources.list.d/trusty.list -O /etc/apt/sources.list.d/ubuntu-ja.list
sudo apt-get purge unity-scope-* unity-lens-video unity-scope-video-remote unity-lens-music unity-lens-photos
sudo apt-get update ; sudo apt-get dist-upgrade -y
#sudo apt-get install aptitude aria2 byobu curl emacs24-nox stunnel4 mew mew-bin ca-certificates emacs-mozc fbterm fcitx-mozc fish flashplugin-installer gdisk git-core git-doc git-gui git-svn gparted hdparm htop procps glances kate kde-baseapps kde-base-artwork kde-config-fcitx kde-l10n-ja ktorrent language-pack-kde-ja language-pack-gnome-ja libfcitx-qt5-1 mozc-server mozc-utils-gui openssh-client parted smartmontools tmux ufw unzip unrar uim-fep uim-xim vim-nox virtualbox vlc xclip wine fish 
sudo apt-get install aptitude aria2 apt-btrfs-snapshot bleachbit btrfs-tools btsync build-essential byobu ca-certificates chkroot comix curl docker.io vim-syntax-docker emacs24-nox emacs-mozc fbterm fcitx-mozc fish flashplugin-installer fonts-inconsolata fonts-takao gdisk git-core git-doc git-gui git-svn glances gparted haskell-platform hdparm htop krita kubuntu-desktopjhead procps glances kate kde-baseapps kde-base-artwork kde-l10n-ja keepass2 ktorrent language-pack-kde-ja language-pack-gnome-ja libfcitx-qt5-1 lib32z1 lib32ncurses5 lib32nss-mdns libdigest-whirlpool-perl libvirt-bin lm-sensors lynx mew mew-bin mozc-server mozc-utils-gui openjdk-7-jdk openssh-client p7zip-rar p7zip-full parted prelink preload privoxy procps pwgen python-software-properties qemu-kvm rkhunter rsync smartmontools stunnel4 testdisk tmux tor tree ubuntu-restricted-extras ufw unzip unrar uim-fep uim-xim vagrant vidalia vim-nox  virt-manager virtualbox vlc xclip w3c wine zram-config
#aptitude aria2 apt-btrfs-snapshot btrfs-tools btsync build-essential byobu ca-certificates curl emacs24-nox emacs-mozc fbterm fcitx-mozc fish flashplugin-installer gdisk git-core git-doc git-gui git-svn glances gparted hdparm htop jhead procps glances kate kde-baseapps kde-base-artwork kde-l10n-ja ktorrent language-pack-kde-ja language-pack-gnome-ja libfcitx-qt5-1 lib32z1 lib32ncurses5 lib32bz2-1.0 lib32nss-mdns libdigest-whirlpool-perl libvirt-bin lm-sensors mew mew-bin mozc-server mozc-utils-gui openjdk-7-jdk openssh-client p7zip-rar p7zip-full parted prelink preload procps qemu-kvm smartmontools stunnel4 testdisk tmux ubuntu-restricted-extras ufw unzip unrar uim-fep uim-xim vim-nox  virt-manager virtualbox vlc xclip wine zram-config
sudo apt-get update ; sudo apt-get dist-upgrade -y
#sudo apt-get purge dragonplayer kwalletmanager
sudo apt-get purge dragonplayer kwalletmanager totem cheese evolution-data-server-common evolution-data-server-online-accounts
sudo apt-get autoclean
#LANG=C; xdg-user-dirs-gtk-update
#LANG=C xdg-user-dirs-update --force
LANG=ja_JP.UTF-8 ; export LANG
#LANG=en_US.UTF-8 ; export LANG
sudo add-apt-repository ppa:ubuntu-clamav/ppa
sudo apt-get install clamav clamav-daemon clamav-freshclam clamfs libclamunrar6
sudo /etc/init.d/clamav-daemon start
ps aux | grep clamav
cd /etc/init.d/
grep clam
sudo /etc/init.d/clamav-daemon start
sudo /etc/init.d/clamav-freshclam
freshclam -d -c 24
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
sudo https://raw.githubusercontent.com/neplus/config/master/etc/rc.local -O /etc/rc.local
sudo mkdir /ramdisk
#chmod 777 /ramdisk;echo /dev/shm /ramdisk   tmpfs   size=8g 0   0 >> /etc/fstab;
#sudo nano /etc/fstab

###http://www.atmarkit.co.jp/flinux/rensai/linuxtips/930clamavdbup.html
#crontab -e
#59 * * * * clamav /usr/bin/freshclam -l /var/log/clamav/freshclam.log
#30 * * * * clamav /usr/bin/freshclam --quiet -l /var/log/freshclam.log
sudo https://raw.githubusercontent.com/neplus/config/master/etc/crontab -O /etc/crontab
/etc/rc.d/init.d/crond restart 
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
mkdir ~/0/0btsync
sudo chmod 775 0btsync
sudo chown neplus:btsync 0btsync
##googlechrome
aria2c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
wget https://raw.github.com/neplus/config/master/.xmodmap ~/.xmodmap
xmodmap ~/.xmodmap
wget https://raw.githubusercontent.com/neplus/config/master/.config/fish/config.fish -O ~/.config/fish/config.fish
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo xmodmap ~/.xmodmap >> ~/.xinitrc
echo xmodmap ~/.xmodmap >> ~/.xsessionrc
alias sechrome="google-chrome-stable --incognito --disable-background-mode --disk-cache-size=1 --disk-cache-size=1 --enable-click-to-play --disable-geolocation --enable-desktop-notifications"
alias chrome="google-chrome-stable --disable-background-mode --disk-cache-size=1 --disk-cache-size=1 --enable-click-to-play --disable-geolocation --enable-desktop-notifications"
echo $SHELL
fish --version
which fish
chsh -s /usr/bin/fish
#su - murasame
#chsh -s /usr/bin/fish
#exit
#im-config

#不要カーネル削除
#sudo apt-get update;sudo apt-get dist-upgrade -y
#sudo apt-get autoremove
#bash
#dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
#fish