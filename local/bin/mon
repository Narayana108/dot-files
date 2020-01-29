#! /bin/bash

### Colours
BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`

BOLD=`tput bold`
RESET=`tput sgr0`

### Commands
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
TEMP=$(sensors | grep Package | awk '{print $4}' | sed 's/\+//g')
DATE=$(date +'%a %b %d')
TIME=$(date +'%H:%M')
BT_STATUS=$(sudo systemctl status bluetooth.target | rg "Active" \
            | awk '{print $2}')
# check if wifi is switched on
WIFI_STATUS=$(nmcli general status | awk '{print $4}'| awk 'NR==2')
# check which wifi network its connected to
WIFI_NET=$(nmcli connection show --active | awk '{print $1}' | awk 'NR==2')
BATTERY=$(acpi | rg "Battery 1" | cut -d " " -f3-)
BAT_STATUS=$(cat /sys/class/power_supply/BAT0/status)
BAT_CAP=$(cat /sys/class/power_supply/BAT0/capacity)

if [ $BAT_STATUS == "Charging" ] || [ $BAT_STATUS == "Full" ]; then
  BCOLOUR=$GREEN
else
  BCOLOUR=$RED
fi


### Print
echo "/---------------------------------------------------------"
echo "| $CYANकृष्ण हरे कृष्ण कृष्ण कृष्ण हरे हरे हरे राम हरे राम  राम राम हरे हरे"$RESET
echo "|---------------------------------------------------------"
echo "| $BOLD$BLUE$TIME$RESET  |  $GREEN$DATE$RESET"
echo "|---------------------------------------------------------"
echo "|WIFI: $BOLD$WIFI_STATUS$RESET - $GREEN$WIFI_NET$RESET"
echo "|Bluetooth: $BOLD$BT_STATUS$RESET"
echo "|---------------------------------------------------------"
echo "|Battery: $BOLD$BCOLOUR$BAT_STATUS$RESET: $BOLD$BAT_CAP%$RESET"
echo "|---------------------------------------------------------"
printf "|Memory\t\tDisk\t\tCPU\t\tTemp\n"
echo "|$BOLD$MEMORY$DISK$CPU$TEMP$RESET"
echo "\---------------------------------------------------------"
