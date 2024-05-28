#!/bin/bash
#==================================================================================\
#    ██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗███████╗
#    ██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔════╝
#    ██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗  ███████╗
#    ██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝  ╚════██║
#    ╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗███████║
#    ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝
#                                              Installer v0.1
#-----------------------------------------------------------------------------------|
#    Copyright information, will be held here.
#    https://jasonkenyon.me
#
#===================================================================================/

##
#   Updates banner
##
cat << Banner

██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗███████╗
██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔════╝
██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗  ███████╗
██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝  ╚════██║
╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗███████║
 ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝
                                            Installer v0.1
         Prepareing your system to perform system updates.                                           
Banner

##
#   Confirm if the user actually 
#   wants to perform the upgrades. 
##
if ! gum confirm --prompt.foreground="#ffaf00" "Do you want to start the updates now?" ; then

##
# Clear the terminal window.
##
clear

##
#   Updates Cancelled Banner.:
##
cat << Cancelled

██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗███████╗     ██████╗ █████╗ ███╗   ██╗ ██████╗███████╗██╗     ██╗     ███████╗██████╗ 
██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔════╝    ██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██║     ██║     ██╔════╝██╔══██╗
██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗  ███████╗    ██║     ███████║██╔██╗ ██║██║     █████╗  ██║     ██║     █████╗  ██║  ██║
██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝  ╚════██║    ██║     ██╔══██║██║╚██╗██║██║     ██╔══╝  ██║     ██║     ██╔══╝  ██║  ██║
╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗███████║    ╚██████╗██║  ██║██║ ╚████║╚██████╗███████╗███████╗███████╗███████╗██████╔╝
 ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚══════╝╚══════╝╚══════╝╚═════╝ 
                                                                                      As per your request, updates have been cancelled.
Cancelled
##
#   Sleep for 1.5 seconds to display
#   confirmation of cancellation.
##
sleep 1.5
##
#   As we intentionally cancel
#   we exit status 1 to the left.
##
exit 1
fi


##
# Clear terminal window
##
clear

##
#   List Packages? Banner
##
cat << listPackages

██╗     ██╗███████╗████████╗    ██████╗  █████╗  ██████╗██╗  ██╗ █████╗  ██████╗ ███████╗███████╗██████╗ 
██║     ██║██╔════╝╚══██╔══╝    ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔════╝ ██╔════╝██╔════╝╚════██╗
██║     ██║███████╗   ██║       ██████╔╝███████║██║     █████╔╝ ███████║██║  ███╗█████╗  ███████╗  ▄███╔╝
██║     ██║╚════██║   ██║       ██╔═══╝ ██╔══██║██║     ██╔═██╗ ██╔══██║██║   ██║██╔══╝  ╚════██║  ▀▀══╝ 
███████╗██║███████║   ██║       ██║     ██║  ██║╚██████╗██║  ██╗██║  ██║╚██████╔╝███████╗███████║  ██╗   
╚══════╝╚═╝╚══════╝   ╚═╝       ╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝  ╚═╝   
                       At this point you have an option to list the packages that are pending updates.                                                                                                     
listPackages
##
#   Lets prompt the user, to 
#   see if they want to get
#   the output of packages
#   that are being updated.
##
if gum confirm --prompt.foreground="#ffaf00" "Do you want to see the packages that are going to be updated? (Note you could copy this into the snapshot comment.)" ; then
    echo ""
    echo "The following packages will be updated:"
    echo " "
    echo "$(gum style --italic --foreground 99 'Arch Repo')"
    checkupdates | awk '{ updates = updates ( NR==1 ? "" : ", ") $1 } END { print updates }'
    echo " "
    echo "$(gum style --italic --foreground 99 'Aur Repo')"
    yay -Qua | awk '{ aurUpdates = updates ( NR==1 ? "" : ", ") $1 } END { print aurUpdates }'
else
    echo "Continuing without providing the packages that will be updated..."
    echo ""
fi


##
#   Display snapshot banner
#   we don't clear the screen
#   because we need to see the packages
#   that are getting updated.
##

cat << snapshot


███████╗███╗   ██╗ █████╗ ██████╗ ███████╗██╗  ██╗ ██████╗ ████████╗██████╗ 
██╔════╝████╗  ██║██╔══██╗██╔══██╗██╔════╝██║  ██║██╔═══██╗╚══██╔══╝╚════██╗
███████╗██╔██╗ ██║███████║██████╔╝███████╗███████║██║   ██║   ██║     ▄███╔╝
╚════██║██║╚██╗██║██╔══██║██╔═══╝ ╚════██║██╔══██║██║   ██║   ██║     ▀▀══╝ 
███████║██║ ╚████║██║  ██║██║     ███████║██║  ██║╚██████╔╝   ██║     ██╗   
╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝     ╚═╝   
               Do you want to do a snapshot before updating, (Recommended)                                                                    
snapshot
##
#   Lets prompt the user if
#   they want to do a snapshot
##

if gum confirm --prompt.foreground="#ffaf00" "Do you want to create a snapshot before proceeding with updates?" ; then
    echo ""
    comment=$(gum input --placeholder "Please enter a comment for the snapshot.")
    sudo timeshift --create --comments "$comment"
    sudo timeshift --list
    echo " "
    echo "Snapshot with comment $comment has been created!"
    echo " "
else
    echo "Continuing updates without taking a snapshot"
    echo " "
fi

##
#   Clear screen and display
#   starting updates banner.
##
clear

##
#   Starting Updates Banner
##
cat << Updates

███████╗████████╗ █████╗ ██████╗ ████████╗██╗███╗   ██╗ ██████╗     ██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗███████╗
██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██║████╗  ██║██╔════╝     ██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔════╝
███████╗   ██║   ███████║██████╔╝   ██║   ██║██╔██╗ ██║██║  ███╗    ██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗  ███████╗
╚════██║   ██║   ██╔══██║██╔══██╗   ██║   ██║██║╚██╗██║██║   ██║    ██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝  ╚════██║
███████║   ██║   ██║  ██║██║  ██║   ██║   ██║██║ ╚████║╚██████╔╝    ╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗███████║
╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝      ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝
                                                                                      Yay is currently installing the updates.

Updates

##
#   Call yay to do the updates.
#   at this point we are doing
#   noconfirm.
##

yay --noconfirm

##
#   Restart waybar to reset
#   the updates counter.
##
killall -SIGUSR2 waybar

##
#   Sleep for a bit to allow
#   a brief moment to review.
##
sleep 3

##
#   Notify the user updates
#   have been completed.
##
notify-send "Updates have been completed."
