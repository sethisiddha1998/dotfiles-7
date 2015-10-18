#!/bin/bash

music(){
	mtoggle="A:mpc toggle:"
	mnext="A4:mpc next:"
	mprevious="A5:mpc prev:"

	if [[ $(mpc status | grep -o "\[playing\]") == "[playing]" ]]; then
		playing=$(mpc current)
	else
		playing="Paused"
	fi

	echo "%{$mtoggle}%{$mnext}%{$mprevious} $playing %{A}%{A}%{A}"
}

volume(){
	volup="A4:pulseaudio-ctl up:"
 	voldown="A5:pulseaudio-ctl down:"
 	volmute="A:pulseaudio-ctl mute:"

	if [[ $(pulseaudio-ctl full-status | awk '/ / {printf $2}') == "yes" ]]; then
		vol="Mute"
		icon=""
	else
		mastervol=$(pulseaudio-ctl full-status | egrep -o "[0-9]+")
		vol=$mastervol
		icon=""
	fi

	echo "%{$volup}%{$voldown}%{$volmute} %{F#$red}$icon%{F} $vol %{A}%{A}%{A}"
}

while :; do
	echo "%{r}$(volume) %{B#$white}%{F#$black}$(music)%{F}%{B}%{r}"
	sleep .3s
done |

orangebar -g "500x$barheight+1420" -f "$barfont" -f "$baricons" -B "#00$black" -F "#$white" 2>/dev/null | bash

