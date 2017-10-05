# android-adb-over-tcp-installer

A script for installing an .apk on multiple Android devices over network via ADB.

## Usage
This is a very simple script, but you will have to set a pair of things.

First of all, edit the `ip_address_list.txt`. Just add your IP's row by row.
```
192.168.1.1
192.168.1.10
192.168.1.20
```

Secondly, add `your_package.apk` to the folder where the script resides.

## Install my package
Once you've done with setup, you have to make the script executable, so open a shell and type:

`sudo chmod +x android-adb-over-tcp-installer.sh`

Now it's time to install your application to all your Android devices.
In your shell type:

`./android-adb-over-tcp-installer.sh`

And watch the magic go on!