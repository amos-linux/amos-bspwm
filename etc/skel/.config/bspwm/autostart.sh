#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

# set wallpaper
wal -i /usr/share/amos/wallpapers/91.jpg
sh ~/.fehbg &
# set polybar
$HOME/.config/polybar/launch_bspwm.sh
#$HOME/.conky/conky-pywal/./start_conky.sh &
xsetroot -cursor_name left_ptr &
export GTK2_RC_FILES="$HOME/.gtkrc-2.0" &
#$HOME/.config/bspwm/scripts/dualscreen.sh &
conky -c $HOME/.config/bspwm/system-overview &
$HOME/.config/bspwm/scripts/dunst.sh &
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
#run plank &
#run glava &
#run picom &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
picom --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
#run volumeicon &

