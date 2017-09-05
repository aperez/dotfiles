if [[ $(dmesg | grep vboxguest) ]]; then
    VBoxClient-all &
fi

if [[ -f ~/.Xresources.d/Xresources ]]; then
    xrdb -merge -I$HOME/.Xresources.d/ ~/.Xresources.d/Xresources
fi

if [[ -f ~/.Xresources ]]; then
    xrdb -merge ~/.Xresources
fi

exec i3
