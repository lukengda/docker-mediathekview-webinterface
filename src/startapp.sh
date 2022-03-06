#!/bin/sh
export HOME=/config

/background-upgrade-window-suppression.sh &

/opt/MediathekView/MediathekView -m $HOME
