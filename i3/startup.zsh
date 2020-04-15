#!/usr/bin/zsh

i3_config="$1"

setopt nobgnice

xrdb ~/dotfiles/x/Xresources

import-gsettings \
    gtk-theme:gtk-theme-name \
    icon-theme:gtk-icon-theme-name \
    cursor-theme:gtk-cursor-theme-name \
    font-name:gtk-font-name

udiskie -s &
redshift &
"${i3_config}"/fullscreen-manager.py &

$BROWSER &
$TERMINAL -name WeeChat -e weechat &
telegram-desktop &
transmission-gtk -m &

if [[ "$HOST" == "Akatsuki" ]]; then
    "${i3_config}"/ws-1.py &
    mako --anchor bottom-center --width 600 --font "Ubuntu Mono 15" &
else
    mako &
fi

if [[ "$HOST" == "Hitagi" ]]; then
    swayidle -w before-sleep 'swaylock -fFc 333333' &
fi
