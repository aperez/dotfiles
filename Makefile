.PHONY: all install-packages stow

all: install-packages

install-packages:
	sudo pacman -Sy --needed - < packages.txt

upgrade:
	sudo pacman -Syyu

