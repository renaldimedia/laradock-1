#!/bin/bash
#app standar untuk laravel dan lumen

print_style () {

    if [ "$2" == "info" ] ; then
        COLOR="96m"
    elif [ "$2" == "success" ] ; then
        COLOR="92m"
    elif [ "$2" == "warning" ] ; then
        COLOR="93m"
    elif [ "$2" == "danger" ] ; then
        COLOR="91m"
    else #default color
        COLOR="0m"
    fi

    STARTCOLOR="\e[$COLOR"
    ENDCOLOR="\e[0m"

    printf "$STARTCOLOR%b$ENDCOLOR" "$1"
}

if [[ $# -eq 0 ]] ; then
    print_style "Missing arguments.\n" "danger"
    display_options
    exit 1
fi
if [ "$1" == "up" ] ; then
    print_style "Running the server\n" "info"
    sudo docker-compose up -d nginx mysql phpmyadmin redis workspace

elif [ "$1" == "down" ]; then
    print_style "Stopping the server\n" "info"
    sudo docker-compose down
fi