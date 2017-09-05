if [[ $(dmesg | grep vboxguest) ]]; then
    VBoxClient-all &
fi

if [[ -f ~/.Xresources  ]]; then
    xrdb -merge -I$HOME ~/.Xresources
fi

exec i3
