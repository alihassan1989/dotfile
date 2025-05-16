#!/usr/bin/bash

while true :; do

  Vol="^c#eeeeee^ ^c#eeeeee^$(amixer --get-volume-human)"
  Bat="^c#eeeeee^ ^c#eeeeee^$(cat /sys/class/power_supply/BAT0/capacity)%"
  Day="^c#eeeeee^ ^c#eeeeee^$(date '+%a,%Y-%m-%d')"
  Time="^c#eeeeee^ ^c#eeeeee^$(date '+%I:%M %p')"
  #Music=" ^c#cba6f7^ ^c#ebdbb2^$(playerctl metadata --format "{{ artist }} - {{ title }}" | awk '{print substr($0, 1, 32)}')"
  Bklit="^c#eeeeee^󰃟 ^c#eeeeee^$(brightnessctl i | awk '/Current brightness/ {print $4}' | sed 's/[()]//g')"
  xsetroot -name "$Music | $Vol | $Bklit | $Bat | $Day | $Time"

  sleep 1

done
