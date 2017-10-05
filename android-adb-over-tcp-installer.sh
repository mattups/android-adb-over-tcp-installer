#!/bin/bash
#android-adb-over-tcp-installer
#Change the ip_address file to add or delete targets
#Place your_package.apk in the same script folder

#Getting timestamp for the log
timestamp_date=$(date +%F_%T)
echo -e "====== Upgrade started on "$timestamp_date" ======\n" >> log.txt

#Getting addresses to install your_package.apk
cat ip_address_list.txt |  while read target
    do
        ping -c 1 "$target" >> /dev/null
        if [ $? -eq 0 ]; then
            adb connect "$target";
            adb install your_package.apk;
            adb disconnect;
            echo "Installed on" $target "- $timestamp_date" >> log.txt;
        else
            echo "Failed on" $target "- $timestamp_date" >> log.txt;
            echo "Upgrade on $target failed, see log";
        fi
    done

echo -e "Done."

#Closing log
echo -e "\n====== Log for upgrade on" $timestamp_date " ======\n" >> log.txt