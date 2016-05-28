  #!/bin/sh
#script -a install_`date +%Y-%m-%d-%H:%M:%S`.log
date
# change to firewalld
#  http://linuxbsdos.com/2014/10/24/replace-ufw-with-firewalld-on-ubuntu-14-10/
# purgeしなくても大丈夫か？indicator packageはどうすれば？
sudo apt-get install firewalld (0.4.0-1)


sudo ufw status verbose
sudo ufw enable
sudo ufw default deny


#sudo add-apt-repository ppa:japaneseteam/ppa
# https://www.ubuntulinux.jp/japanese
wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
sudo wget https://www.ubuntulinux.jp/sources.list.d/xenial.list -O /etc/apt/sources.list.d/ubuntu-ja.list

sudo add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora
###http://orebibou.com/2014/10/apt-get%E3%82%92%E3%82%88%E3%82%8A%E9%AB%98%E9%80%9F%E3%81%AB%EF%BC%81%E3%80%8Eapt-fast%E3%80%8F%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89/
###https://github.com/ilikenwf/apt-fast
#sudo add-apt-repository ppa:saiarcot895/myppa

sudo apt-get purge unity-webapps-common　unity-scope-* unity-lens-video unity-scope-video-remote unity-lens-music unity-lens-photos -y
sudo apt-get update
sudo apt-get install aria2 tasksel firewalld libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev libncurses5-dev autoconf

#==========================================================================================================================
# latest package
* from official binary
btsync
consul
#git                                       (1:2.7.4-0ubuntu1)              ||  wget https://www.kernel.org/pub/software/scm/git/git-2.8.3.tar.xz
docker                                    (1.5-1)                         || 1.11.1 https://github.com/docker/docker/blob/master/CHANGELOG.md curl -fsSL https://get.docker.com/gpg | sudo apt-key add -
virtualbox oracle official             (5.0.18-dfsg-2build1)              || http://download.virtualbox.org/virtualbox/5.0.20/virtualbox-5.0_5.0.20-106931~Ubuntu~xenial_amd64.deb

* cant use apt-get ? use official binary?
vagrant                                vagrant (1.8.1+dfsg-1)             || wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb ; sudo dpkg -i vagrant*.deb
'''
sudo apt-get -sV install vagrant | grep virt
   virtualbox (5.0.18-dfsg-2build1)
'''

https://www.passwordstore.org/          pass (1.6.5-3)                    || The latest version is 1.6.5.
etckeeper                              etckeeper (1.18.2-1ubuntu1

* use apt-get
#rkhunter                               rkhunter (1.4.2-5)                 || https://sourceforge.net/projects/rkhunter/files/rkhunter/
#openjdk-7-jdk or 8 or 9                openjdk-9-jdk (9~b114-0ubuntu1)     
#qbittorrent                            (3.3.1-1)                          || 3.3.4
#emacs24-nox emacs-mozc                    (24.5+1-6ubuntu1)               || wget http://public.p-knowledge.co.jp/gnu-mirror/emacs/emacs-24.5.tar.gz.sig
####http://postd.cc/linux-workstation-security-checklist-part1/
#keepassx                                (2.0.2)                           || https://github.com/keepassx/keepassx
#https://www.clamav.net/downloads#collapseUbuntu                           ||    clamav-base (0.99+dfsg-1ubuntu1) clamav-freshclam (0.99+dfsg-1ubuntu1)    libclamav7 (0.99+dfsg-1ubuntu1)    clamav-docs (0.99+dfsg-1ubuntu1)   clamav (0.99+dfsg-1ubuntu1)   clamav-base (0.99+dfsg-1ubuntu1)   clamav-freshclam (0.99+dfsg-1ubuntu1)   libclamav7 (0.99+dfsg-1ubuntu1)

* from github
vimpager
netdata
stack haskell
fish                                      fish-common (2.2.0-3)           || https://github.com/fish-shell/fish-shell 2.3.0, released April 22, 2016
#==========================================================================================================================

# install fish
# https://github.com/fish-shell/fish-shell#autotools-build
cd $HOME
aria2c https://fishshell.com/files/2.3.0/fish-2.3.0.tar.gz
sha1sum fish-*.gz | grep afc6e9ea4cbd1ade63e9af41280b1f08bff23bba
tar zxvf fish-*.gz
./configure
make;sudo make install
#------------------------------------------------------------------------------------------------------------------------
wget https://raw.githubusercontent.com/neplus/config/master/.config/fish/config.fish -O ~/.config/fish/config.fish
fish --version
FISHPATH=`which fish`
chsh -s $FISHPATH
#上記でダメなら追記してからもう一度chsh -sする(スクリプト自体にroot権限が必要？)
#sudo echo $FISHPATH >> /etc/shells
# chsh -s $FISHPATH

# logoutしないとかわらない？fishのパスをつけ間違えるとログインできなくなるのでほかにユーザを作ってからsu -ほげ　したほうが良い？
# sudo useradd test
# sudo passwd test
#su - ほげ(このスクリプトを動かしているユーザ名)     ##ここでfishにログインできていることを確認したらuserdel
# userdel test
echo $SHELL

#install git 
cd /usr/local/src;pwd
sudo aria2c https://www.kernel.org/pub/software/scm/git/git-2.8.3.tar.xz
gittarpath=`ls -l | grep git-.tar.`
sudo tar -Jxvf git-2.8.3.tar.xz
cd git-2.8.3
sudo make configure
sudo ./configure --prefix=/usr/local/
sudo make all
#sudo make all doc info
#```
#    SUBDIR git-gui
#    SUBDIR gitk-git
#    SUBDIR perl
#Manifying 9 pod documents
#    SUBDIR templates
#make -C Documentation all
#make[1]: ディレクトリ '/usr/local/src/git-2.8.3/Documentation' に入ります
#make[2]: ディレクトリ '/usr/local/src/git-2.8.3' に入ります
#make[2]: 'GIT-VERSION-FILE' は更新済みです.
#make[2]: ディレクトリ '/usr/local/src/git-2.8.3' から出ます
#    ASCIIDOC git-pack-refs.html
#/bin/sh: 2: asciidoc: not found
#Makefile:315: ターゲット 'git-pack-refs.html' のレシピで失敗しました
#make[1]: *** [git-pack-refs.html] エラー 127
#make[1]: ディレクトリ '/usr/local/src/git-2.8.3/Documentation' から出ます
#Makefile:2041: ターゲット 'doc' のレシピで失敗しました
#make: *** [doc] エラー 2
#```
sudo make install
#sudo make install install-doc install-html install-info
#```
#/bin/sh: 2: asciidoc: not found
#Makefile:332: ターゲット 'git-pack-refs.xml' のレシピで失敗しました
#make[1]: *** [git-pack-refs.xml] エラー 127
#make[1]: ディレクトリ '/usr/local/src/git-2.8.3/Documentation' から出ます
#Makefile:2366: ターゲット 'install-doc' のレシピで失敗しました
#```
#-----------------------------------------------------------------------------------------------------------------------

# back home
cd $HOME;pwd

#copy tools
git clone https://github.com/networkelements/gittool.git
cd gittool
chmod +x *.sh
ls -l

# install etckeeper


#install apt-fast
cd /usr/local/src;pwd
sudo git clone https://github.com/ilikenwf/apt-fast.git
cd apt-fast
sudo cp apt-fast /usr/bin/
sudo chmod +x /usr/bin/apt-fast
sudo cp apt-fast.conf /etc

sudo wget https://raw.githubusercontent.com/networkelements/config/master/etc/apt-fast.conf -O /etc/apt-fast.conf

# back home
cd $HOME;pwd

sudo apt-fast install aptitude aria2 apt-btrfs-snapshot bleachbit btrfs-tools build-essential byobu ca-certificates chkrootkit comix curl fbterm fcitx-mozc flashplugin-installer fonts-inconsolata fonts-takao g++ gdisk glances gparted hdparm htop krita jhead procps glances kate kde-baseapps kde-base-artwork kde-l10n-ja ktorrent language-pack-kde-ja language-pack-gnome-ja lib32z1 lib32ncurses5 libdigest-whirlpool-perl libvirt-bin lm-sensors lynx mew mew-bin mozc-server mozc-utils-gui openssh-client p7zip-rar p7zip-full parted prelink preload privoxy procps pwgen python-software-properties qemu-kvm rsync smartmontools stunnel4 testdisk tmux tor tree ubuntu-restricted-extras ufw unzip unrar uim-fep uim-xim vim-nox virt-manager vlc xclip wine zram-config gettext ubuntu-defaults-ja ppa-purge rkhunter openjdk-9-jdk qbittorrent emacs24-nox emacs-mozc keepassx tasksel aria2 firewalld clamav bash-completion chrony libssl-dev libtool libboost-all-dev pkg-config yasm


#chinachu
###http://www.jifu-labo.net/2015/09/ubuntu_pre/

#bash-completion chrony libssl-dev libtool libboost-all-dev pkg-config yasm
sudo nano /etc/chrony/chrony.conf

server ntp.nict.jp iburst minpoll 10 maxpoll 12
server ntp.mita.keio.ac.jp iburst minpoll 10 maxpoll 12
server ntp.sfc.keio.ac.jp iburst minpoll 10 maxpoll 12
server ntp.nc.u-tokyo.ac.jp iburst minpoll 10 maxpoll 12
server eric.nc.u-tokyo.ac.jp iburst minpoll 10 maxpoll 12
server ntp.cablenet.ne.jp iburst minpoll 10 maxpoll 12


sudo systemd status chrony.service


mkdir ~/git
cd ~/git
git clone https://github.com/m-tsudo/pt3.git
cd pt3
make
sudo make install
 
#※ Ubuntu 15.04以降のバージョンでは以下を実行必須です。
sudo vi /etc/modprobe.d/blacklist.conf 
#デフォルトのearth-pt3ドライバと競合するため、ファイル末尾に下記を追記
　   blacklist earth-pt3
 
sudo reboot
# 再起動後、ドライバモジュールがロードされているかを確認します。
lsmod | grep pt3
# 続いて、PT3のデバイスファイルが作成されていることを確認します。
ls -l /dev/pt3*

cd ~/git
git clone https://github.com/stz2012/libarib25.git
cd libarib25/
make
sudo make install
sudo /sbin/ldconfig

mkdir ~/src
cd ~/src
wget http://hg.honeyplanet.jp/pt1/archive/tip.tar.bz2
tar xvjf tip.tar.bz2
tar xvzf recpt1-http-rev4.tar.gz
patch -p2 -d pt1-c8688d7d6382/recpt1/ < recpt1-http-rev4/recpt1-http.diff
cd pt1-c8688d7d6382/recpt1/
sed -i".org" 's/pt1video/pt3video/g' pt1_dev.h
./autogen.sh
./configure --enable-b25
make
sudo make install

recpt1 --b25 --strip 27 10 ~/test.ts


sudo adduser chinachu
sudo -i -u chinachu
git clone git://github.com/kanreisa/Chinachu.git ~/chinachu
cd ~/chinachu
./chinachu installer
echo "[]" > rules.json
cp config.sample.json config.json
emacs config.json

./chinachu service operator execute
./chinachu update -f
./chinachu service operator initscript > /tmp/chinachu-operator
./chinachu service wui initscript > /tmp/chinachu-wui

cd /tmp
sudo chown root:root chinachu-*
sudo chmod 755 chinachu-*
sudo mv chinachu-* /etc/init.d/
sudo update-rc.d chinachu-operator defaults
sudo update-rc.d chinachu-wui defaults
sudo service chinachu-operator start
sudo service chinachu-wui start
ps ax | grep chinachu

sudo service chinachu-operator restart
sudo service chinachu-wui restart














★# $HOME/.fontsにコピーを忘れずに



sudo apt-get update ; sudo apt-get dist-upgrade -y
sudo apt-get purge dragonplayer seahorse kwalletmanager totem cheese evolution-data-server-common evolution-data-server-online-accounts -y
sudo apt-get autoclean
#LANG=C; xdg-user-dirs-gtk-update
#LANG=C xdg-user-dirs-update --force
LANG=ja_JP.UTF-8 ; export LANG
#LANG=en_US.UTF-8 ; export LANG

#sudo add-apt-repository ppa:ubuntu-clamav/ppa
#sudo apt-get install clamav clamav-daemon clamav-freshclam clamfs libclamunrar6 -y
#sudo freshclam
#cd /etc/init.d/
#sudo /etc/init.d/clamav-daemon start
#sudo /etc/init.d/clamav-freshclam
#ps aux | grep clamav
##sudo freshclam -d -c 24
#sudo less -f /var/log/clamav/freshclam.log
###http://ubuntufreak.net/set/security-set2.html
#cd /usr/share/doc/clamfs/
#sudo gzip -d /usr/share/doc/clamfs/clamfs-sample.xml.gz
#sudo cp /usr/share/doc/clamfs/clamfs-sample.xml /etc/clamfs.xml
#sudo mkdir -p /usr/share/doc/clamfs//clamfs/tmp
#sudo clamfs /etc/clamfs.xml
#cd /etc
#sudo cp /etc/clamfs.xml /etc/clamfs_home.xml
#sudo mkdir -p /etc/clamfs/home
#sudo clamfs /etc/clamfs_home.xml

★
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
#cd ~/
#aria2c http://downloads.sourceforge.net/keepass/KeePass-2.30-Japanese.zip
#unzip KeePass*.zip
#sudo rsync -varshz Japanese.lngx /usr/lib/keepass2/



###Tor and privoxy
wget https://raw.githubusercontent.com/neplus/config/master/.bashrc -O ~/.bashrc
sudo wget https://raw.githubusercontent.com/neplus/config/master/etc/privoxy/config -O /etc/privoxy/config
sudo cat /etc/privoxy/config

;change systemd
sudo service tor restart
sudo service privoxy restart
sudo update-rc.d tor enable
sudo update-rc.d privoxy enable


##btsync
# change

mkdir -p ~/0/0btsync

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

#chsh -s /usr/bin/fish
#exit
#im-config

#不要カーネル削除
#sudo apt-get update;sudo apt-get dist-upgrade -y
#sudo apt-get autoremove
#bash
#dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
#fish
