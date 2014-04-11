<!-- -*- gfm -*- -->

## UbuntuMinimal install後に実行するコマンド ##
	;; sudo add-apt-repository ppa:japaneseteam/ppa
	$ mv ~/ドキュメント ~/Documents
	$ mv ~/デスクトップ ~/Desktops
	$ mv ~/ダウンロード~/Downloads
	$ mv ~/音楽 ~/Music
	$ mv ~/ピクチャ ~/Pictures
	$ mv ~/ビデオ ~/Videos
	$ mv ~/公開 ~/Public
	
	$ sudo ufw status
	$ sudo ufw enable
	$ wget https://raw.github.com/neplus/config/master/.xmodmap ~/.xmodmap
	$ xmodmap ~/.xmodmap
	$ LANG=ja_JP.UTF-8 ; export LANG
	$ sudo apt-get update;sudo apt-get dist-upgrade -y
	$ sudo apt-get install aptitude aria2 apt-btrfs-snapshot btrfs-tools build-essential byobu curl emacs24-nox emacs-mozc fbterm flashplugin-installer fonts-vlgothic gdisk git-core git-doc git-gui git-svn gparted jhead kde-l10n-ja ktorrent language-pack-kde-ja language-pack-gnome-ja lib32z1 lib32ncurses5 lib32bz2-1.0 lib32nss-mdns libdigest-whirlpool-perl libvirt-bin mikutter openjdk-7-jdk openssh-client p7zip-rar p7zip-full parted prelink preload qemu-kvm sakura scala tmux ubuntu-restricted-extras ufw unzip unrar uim-fep tilda vim-nox virt-manager virtualbox vlc w3m xclip zram-config zsh
	$ sudo apt-get update;sudo apt-get dist-upgrade -y
	$ sudo apt-get autoclean

	$ sudo wget https://raw.github.com/neplus/config/master/etc/default/preload -O /etc/default/preload
	$ sudo service preload restart

	$ echo $SHELL
	$ zsh --version
	$ which zsh
	$ cat /etc/passwd|tail -3
	$ chsh -s /usr/bin/zsh
	$ sudo mkdir /ramdisk
	$ sudo chmod 777 /ramdisk
	$ sudo echo /dev/shm /ramdisk   tmpfs   size=8g 0   0 >> /etc/fstab
	$ sudo reboot
	% sudo ufw status
	% cat /proc/swaps
	% dmesg | grep zram
	% sudo swapon -s
	% echo $SHELL
	% cat /etc/passwd|tail -3
	% cat /etc/mtab
	% git clone https://github.com/neplus/zsh.d.git ~/.zsh.d
	% echo "source ~/.zsh.d/zshrc" > ~/.zshrc
	% echo "source ~/.zsh.d/zshenv" > ~/.zshenv
	% wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ~/Downloads
	% cd ~/Downloads
	% sudo dpkg -i google-chrome-stable_current_amd64.deb
	;; % sudo apt-get install fcitx-mozc mozc-server mozc-utils-gui uim-xim wine
	 
	
## UbuntuServer install後に実行するコマンド ##
	$ sudo ufw status
	$ sudo ufw enable
	$ sudo ufw allow ssh
	$ sudo ufw app list
	$ sudo apt-get update;sudo apt-get dist-upgrade -y
	$ sudo apt-get install openssh-server
	$ sudo wget https://raw.github.com/neplus/config/master/etc/network/interfaces -O /etc/network/interfaces_test
	// em0がeth0になっていた時期があったのでまたどこ関わる可能性もあるので必ず確認
	$ sudo sdiff /etc/network/interfaces /etc/network/interfaces_test
	// 問題がなさそうであれば上書きする
	$ sudo wget https://raw.github.com/neplus/config/master/etc/network/interfaces -O /etc/network/interfaces
	$ sudo wget https://raw.github.com/neplus/config/master/etc/sysctl.conf -O /etc/sysctl.conf_test
	//同じように差分を確認
	$ sudo sdiff /etc/sysctl.conf /etc/sysctl.conf_test
	// 問題がなさそうであれば上書きする
	$ sudo wget https://raw.github.com/neplus/config/master/etc/sysctl.conf -O /etc/sysctl.conf
	$ sudo /etc/init.d/networking restart
	$ sudo service network restart
	$ sudo reboot
	$ ifconfig
	$ sudo ufw status
	
	// 以降、サーバー側からではなく、クライアントのほうから作業する
	// "username" はインストール時に決めたユーザーの名前。""は不要。rootでのログインは不可能。
	$ ssh -C "username"@192.168.1.254
	// loginできたらlogoutして、鍵を作成する
	$ exit
	$ ssh-keygen
	$ ssh-copy-id "username"@192.168.1.254
	// 公開鍵でサーバーへlogin
	$ ssh -C "username"@192.168.1.254
	$ sudo wget https://raw.github.com/neplus/config/master/etc/ssh/Ubuntu-s/sshd_config -O /etc/ssh/sshd_config_test
	$ sudo sdiff /etc/ssh/sshd_config /etc/ssh/sshd_config_test
	$ sudo wget https://raw.github.com/efr700/config/master/etc/ssh/Ubuntu-s/sshd_config -O /etc/ssh/sshd_config
	$ sudo service ssh restart
	$ sudo apt-get install aptitude aria2 apt-btrfs-snapshot btrfs-tools emacs24-nox emacs-mozc fbterm fetchmail gdisk git fonts-vlgothic openssh-server preload prelink rtorrent samba sysv-rc-conf tmux  ttf-vlgothic uim-fep uim-mozc vim-nox w3m zram-config zsh
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
	% git clone https://github.com/neplus/zsh.d.git ~/.zsh.d
	% echo "source ~/.zsh.d/zshrc" > ~/.zshrc
	% echo "source ~/.zsh.d/zshenv" > ~/.zshenv
	% sudo sysv-rc-conf
