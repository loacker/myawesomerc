#!/bin/bash

# command: ${0}
# description: Simple shell script to test the awesome wm configuration file.


VERSION=0.5
XDG_CONFIG_HOME=$(pwd)


if [ -n "${DEBUG}" ] && [ "${DEBUG}" == "1" ]; then
    set -x
fi


usage() {
    cat <<__EOF__

Simple shell script to check the test the awesome wm configuration file.
Start a nested xorg-server in background using Xephyr.
The parent directory of this script need to be called 'awesome' because the wm
search for the configuration file in the directory '\$XDG_CONFIG_HOME/awesome/'
and here we set '\$XDG_CONFIG_HOME' to $(pwd), otherwise the import of library
like 'lain' generate errors.


Usage:
   test.sh [-s|--size <size>] [-d|--display <display>] filename

Options:
    -s|--size       Nested X11 instance size. (Default to 800x600) 
    -d|--display    Value for the DISPLAY variable. (Default to :3)

Argument:
    filename           rc.lua configuration file

Debug:
    Set the environment variable DEBUG with the value 1.

Examples:
    $ ${0} rc.lua
    $ ${0} -s 1024x768 rc.lua
    $ ${0} -d :2 rc.lua
    $ DEBUG=1 ${0} -s 1024x768 -d :5 rc.lua

__EOF__
}


while [ ${#} -gt 0 ]
do
    arg=${1}
    shift
    case "${arg}" in
        -s|--size) size=${1}; shift ;;
        -d|--display) display=${1}; shift ;;
        -h|--help) usage; exit 0 ;;
        -v|--version) echo "${VERSION}"; exit 0 ;;
        -*) usage "You have specified an invalid option: ${arg}"; exit 1 ;;
        *) filename=${arg}
     esac
done


command() {
    Xephyr -ac -br -noreset -screen ${size} ${display} &
    XDG_CONFIG_HOME=${XDG_CONFIG_HOME%%awesome} DISPLAY=${display} awesome -c ${filename}
}


if [ -z "${size:=800x600}" -o -z "${display:=:3}" -o -z "${filename}" ]; then
    usage
    exit 0
else
    command
fi


# vim: set ts=8 sw=4 sts=4 tw=79 ff=unix ft=sh et ai :
