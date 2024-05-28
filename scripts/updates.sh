#!/bin/bash
#==================================================================================\
#    ██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗███████╗
#    ██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔════╝
#    ██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗  ███████╗
#    ██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝  ╚════██║
#    ╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗███████║
#     ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝
#					           Counter v0.1
#-----------------------------------------------------------------------------------|
#    Copyright information, will be held here.
#    https://jasonkenyon.me
#
#===================================================================================/

##
#  Color Thresholds
###
orangeThreshold=5
redThreshold=15

##
##
#  Check main arch updates repo
#  and return updates count
###
archUpdates=$( checkupdates 2> /dev/null | wc -l );

##
#  Check aur updates repo and 
#  return the updates count
#  yay -Qua causes waybar 
#  to crash. so instead
#  use trizen.
###
aurUpdates=$( trizen -Su --aur --quiet | wc -l )

##
#  Combine arch + aur updates
#  for a total update count
##
combinedUpdates=$(( "$archUpdates" + "$aurUpdates" ))

##
# Define the color widget in
# waybar should be: stable,
# orange or red.
##
waybarClass="stable"

if [ "$combinedUpdates" -gt $orangeThreshold ]; then
    waybarClass="orange"
fi

if [ "$combinedUpdates" -gt $redThreshold ]; then
    waybarClass="red"
fi

##
# Send update to waybar
##
if [ "$combinedUpdates" ]; then
    printf '{ "text": " %s", "alt": "%s", "tooltip": "%s Arch, %s Aur Updates", "class": "%s" }' "$combinedUpdates" "$combinedUpdates" "$archUpdates" "$aurUpdates" "$waybarClass"
else
    printf '{ "text": " 0", "alt": "0", "tooltip": 0 Updates" }'
fi
