.PHONY: all install-packages stow

STOWFLAGS = --ignore "readme\..*" --ignore "\.gitignore" --restow

all: install-packages set-terminal stow

install-packages:
	cat packages.txt | xargs sudo apt-get install -y

set-terminal:
	sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvt

stow:
	stow $(STOWFLAGS) `ls -d */`
