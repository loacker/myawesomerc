# myawesomerc

My awesome windows manager config.

Exec the test.sh script without parameter to get help.
The script start a a nested xorg-server in background using Xephyr.

~~~
(master):matteo@mobyfdick:awesome $ ./test.sh 

Simple shell script to test the awesome wm configuration file.
Start a nested xorg-server in background using Xephyr.
The parent directory of this script need to be called 'awesome' because the wm
search for the configuration file in the directory '$XDG_CONFIG_HOME/awesome/'

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
    $ ./test.sh rc.lua
    $ ./test.sh -s 1024x768 rc.lua
    $ ./test.sh -d :2 rc.lua
    $ DEBUG=1 ./test.sh -s 1024x768 -d :5 rc.lua

~~~
