#!/bin/bash
set -o pipefail

updateinfowindow=$(xdotool search --name ^Programminformation | tail -1)
if [[ $? == 0 ]]
then
    echo -e "Found an update message window, Closing $updateinfowindow"
    xdotool windowactivate --sync $updateinfowindow
    xdotool key Escape
    sleep 3
    xdotool key Escape
    sleep 3
else
    echo -e "Did NOT find an update information window."
fi

updatewindow=$(xdotool search --name "^Software Update" | tail -1)
if [[ $? == 0 ]]
then
    echo -e "Found an update window, Closing $updatewindow"
    xdotool windowactivate --sync $updatewindow
    xdotool key Escape
    sleep 3
    xdotool key Escape
    sleep 3
else
    echo -e "Did NOT find an update information window."
fi

mvwindow=$(xdotool search --name ^Mediathekview | tail -1)
if [[ $? == 0 ]]
then
    echo -e "Found the main MediathekView window, refreshing movie list in window $mvwindow…"
    xdotool windowactivate --sync $mvwindow
    xdotool key F5
else
    echo -e "ERROR: Did NOT find the MediathekView window."
fi
