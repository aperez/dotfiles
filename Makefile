.PHONY: all install-packages stow

all: install-packages stow

install-packages:
	sudo pacman -Sy --needed pacaur
	pacaur -S --needed --noconfirm `cat packages.txt`

stow:
	stow --restow `ls -d */`
