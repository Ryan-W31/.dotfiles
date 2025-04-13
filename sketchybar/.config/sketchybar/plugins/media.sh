#!/bin/sh

RUNNING=$(osascript -e 'if application "Music" is running then return 0')
if [ "$RUNNING" == "" ]; then
    RUNNING=1
fi

PLAYING=1
TRACK=""
ALBUM=""
ARTIST=""

if [ "$(osascript -e 'if application "Music" is running then tell application "Music" to get player state')" == "playing" ]; then
    PLAYING=0
    TRACK=$(osascript -e 'tell application "Music" to get name of current track')
    ARTIST=$(osascript -e 'tell application "Music" to get artist of current track')
    ALBUM=$(osascript -e 'tell application "Music" to get album of current track')
fi

echo $RUNNING
echo $PLAYING
echo $TRACK
echo $ARTIST

if [ $RUNNING -eq 0 ] && [ $PLAYING -eq 0 ]; then
    if [ "$ARTIST" == "" ]; then
        sketchybar -m --set media label="$TRACK - $ALBUM"
    else
        sketchybar -m --set media label="$TRACK - $ARTIST"
    fi
else
    sketchybar -m --set media label="Not Playing"
fi
