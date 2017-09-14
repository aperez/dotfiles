.PHONY: all install-packages stow

STOWFLAGS = --ignore "readme\..*" --restow

all: install-packages stow

install-packages:
	sudo pacman -Sy --needed pacaur
	pacaur -S --needed --noconfirm `cat packages.txt`

stow:
	stow $(STOWFLAGS) `ls -d */`
