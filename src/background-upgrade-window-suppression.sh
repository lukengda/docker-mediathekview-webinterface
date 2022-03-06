#!/bin/bash
set -o pipefail

# Reset the log so only the latest boot is logged.
rm -f /config/upgrade-window-suppression.log

# Run for 5 Minutes in 10 second intervals to check for the initial install4j upgrade window.

for i in {1..30}
do
    updatewindow=$(xdotool search --name ^Aktualisierungsprogramm | tail -1)
    if [[ $? == 0 ]]
    then
        echo -e "Found the install4j updater window, closing…" >> /config/upgrade-window-suppression.log
        xdotool windowactivate --sync $updatewindow
        xdotool key Escape
        sleep 1
        xdotool key Return
        exit 0
    else
        echo -e "Did NOT find the install4j updater window." >> /config/upgrade-window-suppression.log
        mvwindow=$(xdotool search --name ^Mediathekview | tail -1)
        if [[ $? == 0 ]]
        then
            echo -e "Mediathekview started, no update available. Stopping search." >> /config/upgrade-window-suppression.log
            exit 0
        fi
    fi
    
    sleep 10
done
