#!/bin/bash
#android-adb-over-tcp-installer
#Change the ip_address file to add or delete targets
#Place your_package.apk in the same script folder

#Creating log with timestamp filename
timestamp_date=$(date +%F_%T)
touch log_"$timestamp_date".txt

#Getting addresses to install your_package.apk
#TODO Define logic for ADB
echo -e "====== Process started on "$timestamp_date" ======\n" >> log_$timestamp_date.txt

cat ip_address_list.txt |  while read target
    do
        ping -c 1 "$target" >> /dev/null
        if [ $? -eq 0 ]; then
            adb connect "$target" &&
            adb install your_package.apk &&
            adb disconnect;
            echo "Installed on" $target "- $timestamp_date" >> log_$timestamp_date.txt;
        else
            echo "Installation failed on" $target "- $timestamp_date" >> log_$timestamp_date.txt;
            echo "Installation on $target failed, see log";
        fi
    done

echo -e "Done."

#Closing log
echo -e "\n====== Process finished on "$timestamp_date" ======\n" >> log_$timestamp_date.txt