default: add-repositories install-packages enable-services link-config set-shell install-spacemacs sync-neovim show-notes

add-repositories:
	cat repositories.txt | sudo tee -a /etc/pacman.conf

install-packages:
	sudo pacman -Sy yaourt
	yaourt -S --needed --noconfirm `cat packages.txt`

enable-services:
	sudo systemctl enable lightdm NetworkManager tlp tlp-sleep
	sudo systemctl disable systemd-rfkill
	sudo tlp start

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which fish`

install-spacemacs:
	git clone git@github.com:syl20bnr/spacemacs.git ~/.emacs.d

sync-neovim:
	./neovim/.config/nvim/sync.sh

show-notes:
	cat ./post-install.txt
