<!-- -*- gfm -*- -->
# 設定ファイル置き場 #

## UbuntuMinimal install後に実行するコマンド ##
Installation/MinimalCD - Community Ubuntu Documentation
(https://help.ubuntu.com/community/Installation/MinimalCD)
Ubuntu 13.04の最小(CUI)インストールメモ: φ(..)メモメモ
(http://smiyaz.cocolog-nifty.com/blog/2013/06/ubuntu-1304-a07.html)
  $ sudo add-apt-repository ppa:japaneseteam/ppa
  $ sudo ufw status
  $ sudo ufw enable
  $ sudo apt-get update;sudo apt-get dist-upgrade -y
  $ sudo apt-get install aptitude aria2 build-essential byobu curl emacs24-nox emacs-mozc fbterm fcitx-mozc flashplugin-installer fonts-vlgothic gdisk git-core git-doc git-gui git-svn gparted jhead kde-l10n-ja ktorrent language-pack-kde-ja language-pack-gnome-ja lib32z1 lib32ncurses5 lib32bz2-1.0 lib32nss-mdns libvirt-bin mikutter mozc-server mozc-utils-gui openjdk-7-jdk openssh-client p7zip-rar p7zip-full parted prelink preload qemu-kvm sakura scala sysv-rc-conf ttf-vlgothic tmux ubuntu-restricted-extras ufw unzip unrar uim-fep uim-xim tilda vim-nox virt-manager virtualbox vlc w3m wine xclip zram-config zsh
  $ sudo apt-get update;sudo apt-get dist-upgrade -y
  $ sudo apt-get autoclean
  $ wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ~/Donwloads
  $ sudo wget https://raw.github.com/efr700/config/master/etc/default/preload -O /etc/default/preload
  $ sudo service preload restart
  $ wget https://raw.github.com/efr700/config/master/.xmodmap ~/.xmodmap
  $ xmodmap ~/.xmodmap
  $ LANG=ja_JP.UTF-8 ; export LANG
  $ echo $SHELL
  $ zsh --version
  $ which zsh
  $ cat /etc/passwd|tail -3
  $ chsh -s /usr/bin/zsh
  $ sudo mkdir /ramdisk
  $ sudo chmod 777 /ramdisk
  $ sudo echo /dev/shm /ramdisk   tmpfs   size=8g 0   0 >> /etc/fstab
  $ sudo reboot
  % cat /proc/swaps
  % dmesg | grep zram
  % sudo swapon -s
  % echo $SHELL
  % cat /etc/passwd|tail -3
  % cat /etc/mtab
  % git clone https://github.com/efr700/zsh.d.git ~/.zsh.d
  % echo "source ~/.zsh.d/zshrc" > ~/.zshrc
  % echo "source ~/.zsh.d/zshenv" > ~/.zshenv
  % sudo sysv-rc-conf



## UbuntuServer install後に実行するコマンド ##
  $ sudo ufw status
  $ sudo ufw enable
  $ sudo apt-get update;sudo apt-get dist-upgrade -y
  $ sudo apt-get install aptitude aria2 emacs24-nox emacs-mozc fbterm fetchmailgit fonts-vlgothic openssh-server rtorrent samba tmux ttf-vlgothic uim-fep uim-mozc vim-nox w3m openssh-server rtorrent samba sysv-rc-conf tmux  ttf-vlgothic
  $ sudo apt-get update;sudo apt-get dist-upgrade -y
  $ sudo apt-get autoclean
  $ sudo wget https://raw.github.com/efr700/config/master/etc/default/preload -O /etc/default/preload
  $ sudo service preload restart
  $ wget https://raw.github.com/efr700/config/master/.xmodmap ~/.xmodmap
  $ xmodmap ~/.xmodmap
  $ LANG=ja_JP.UTF-8 ; export LANG
  $ echo $SHELL
  $ zsh --version
  $ which zsh
  $ cat /etc/passwd|tail -3
  $ chsh -s /usr/bin/zsh
  $ sudo mkdir /ramdisk
  $ sudo chmod 777 /ramdisk
  $ sudo echo /dev/shm /ramdisk   tmpfs   size=10g 0   0 >> /etc/fstab
  $ sudo reboot
  % cat /proc/swaps
  % dmesg | grep zram
  % sudo swapon -s
  % echo $SHELL
  % cat /etc/passwd|tail -3
  % cat /etc/mtab
  % git clone https://github.com/efr700/zsh.d.git ~/.zsh.d
  % echo "source ~/.zsh.d/zshrc" > ~/.zshrc
  % echo "source ~/.zsh.d/zshenv" > ~/.zshenv
  % sudo sysv-rc-conf
