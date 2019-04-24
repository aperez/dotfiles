.PHONY: all install-packages stow

STOWFLAGS = --ignore "readme\..*" --ignore "\.gitignore" --restow

all: install-packages stow

install-packages:
	sudo pacman -Sy --needed pacaur
	pacaur -S --needed --noconfirm `cat packages.txt`

stow:
	stow $(STOWFLAGS) `ls -d */`
