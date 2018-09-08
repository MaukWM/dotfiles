#!/bin/bash

MAX_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/max_brightness);
USERNAME=$(whoami);
CURRENT_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness);

#checkUser(){
#	if [ $USERNAME != "root" ]; 
#		then printf "\nrun this script as root\n" && exit; 
#		fi;
#}

error_report(){
	printf "error: the backlight brightness value $1 is out of range, use only [0,$MAX_BRIGHTNESS]\n";
}

#checkUser;

NEW_BRIGHTNESS=$(($CURRENT_BRIGHTNESS + $1))

if (("$NEW_BRIGHTNESS" < "0"));
then NEW_BRIGHTNESS=0;
fi;

if (("$NEW_BRIGHTNESS" > "$MAX_BRIGHTNESS"));
then NEW_BRIGHTNESS=$MAX_BRIGHTNESS;
fi;

echo $NEW_BRIGHTNESS

echo $NEW_BRIGHTNESS > /sys/class/backlight/intel_backlight/brightness; 

