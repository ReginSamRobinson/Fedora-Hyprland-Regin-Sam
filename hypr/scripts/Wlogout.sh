#!/bin/bash
pkill wlogout
wlogout --protocol layer-shell -b 6 -c 0 -r 0 -m 10 --width 80 --height 80 &
