#!/bin/bash

DIR="$HOME/Imagenes/screenshots/"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"

option1="Seleccionar ventana (delay 3 sec)"
option2="Seleccionar área"
option3="Pantalla completa (delay 3 sec)"

options="$option2\n$option3\n$option1"

choice=$(echo -e "$options" | rofi -i -dmenu -replace -width 30 -l 3 -p "Capturar pantalla")

case $choice in
$option1)
	scrot $DIR$NAME -d 3 -e 'xclip -selection clipboard -t image/png -i $f' -c -z -u
	notify-send "Captura creada" "Modo: Seleccionar ventana"
	;;
$option2)
	scrot $DIR$NAME -s -e 'xclip -selection clipboard -t image/png -i $f'
	notify-send "Captura creada" "Modo: Seleccionar área"
	;;
$option3)
	scrot $DIR$NAME -d 3 -e 'xclip -selection clipboard -t image/png -i $f'
	notify-send "Captura creada" "Modo: Pantalla completa"
	;;
esac
