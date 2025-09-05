.PHONY: all install-packages stow

all: install-packages stow

install-packages:
	sudo pacman -Sy --needed - < packages.txt

stow:
	stow -v --target ${HOME} --restow `ls -d */`

upgrade:
	sudo pacman -Syyu
