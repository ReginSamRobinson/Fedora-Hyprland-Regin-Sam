#!/bin/bash
if pgrep -x "wf-recorder" > /dev/null; then
    pkill -INT -x wf-recorder
    notify-send "Recording" "Stopped and saved to ~/Videos" -i camera-video
else
    FILENAME="Recording_$(date +%d-%m_%H-%M).mp4"
    notify-send "Recording" "Select area to start..." -i camera-video
    wf-recorder -g "$(slurp)" -f "$HOME/Videos/$FILENAME" &
fi
