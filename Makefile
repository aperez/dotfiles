.PHONY: all install-packages stow

STOWFLAGS = -v --ignore "readme\..*" --ignore "\.gitignore" --target ${HOME} --restow

all: install-packages stow

install-packages:
	sudo pacman -Sy --needed - < packages.txt

stow:
	stow $(STOWFLAGS) `ls -d */`

upgrade:
	sudo pacman -Syyu

