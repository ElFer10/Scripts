#!/bin/bash
echo $XDG_SESSION_TYPE
if [ $XDG_SESSION_TYPE == "wayland" ]; then
	lockapp=swaylock
else
	lockapp=slock
fi
echo "Using $lockapp to lock the screen."

option1="  Bloquear pantalla"
option2="  Salir de Qtile"
option3="  Reiniciar"
option4="  Apagar"

options="$option1\n"
options="$options$option2\n"
options="$options$option3\n$option4"

choice=$(echo -e "$options" | rofi -dmenu -replace -i -no-show-icons -l 4 -width 30 -p "Powermenu")

case $choice in
$option1)
	$lockapp
	;;
$option2)
	qtile cmd-obj -o cmd -f shutdown
	;;
$option3)
	systemctl reboot
	;;
$option4)
	systemctl poweroff
	;;
esac
