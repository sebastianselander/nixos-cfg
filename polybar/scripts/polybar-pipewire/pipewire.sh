#!/bin/sh

getDefaultSink() {
    defaultSink=$(pactl info | awk -F : '/Default Sink:/{print $2}')
    description=$(pactl list sinks | sed -n "/${defaultSink}/,/Description/s/^\s*Description: \(.*\)/\1/p")
    echo "${description:0:8}"
}

VOLUME=$(pamixer --get-volume-human)
SINK=$(getDefaultSink)

case $1 in
    "--up")
        pamixer --increase 5
        ;;
    "--down")
        pamixer --decrease 5
        ;;
    "--mute")
        pamixer --toggle-mute
        ;;
    *)
        echo "${VOLUME} - ${SINK}" 
esac
