if [[ $(dmesg | grep vboxguest) ]]; then
    VBoxClient-all &
fi

xrdb -merge -I$HOME/.Xresources.d/ ~/.Xresources.d/Xresources

if [[ -f ~/.Xresources  ]]; then
    xrdb -merge ~/.Xresources
fi

exec i3
