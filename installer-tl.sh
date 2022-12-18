#!/bin/bash
# Welcome To the contents of the sh installer. You can customize your installation here.
# This installation is only for Debian-based distributions.
# Run bash ./installer.sh on terminal in order to install, no sudo is required to run except apt installations, copying files and permissions on system directories.

if [ "$(id -u)" -eq 0 ]
then
    if [ -n "$SUDO_USER" ]
    then
        printf "This script has to run as normal user or root in a running session. (not sudo)\n" >&2
        exit 1
    fi
fi

echo 'Welcome to TL:Legacy Online SH Installer for Debian-based distributions by RuahWonders!'
sleep 1
echo 'This installer is gonna install TL system-wide.'
sleep 1
echo 'Packages that are gonna install on the system:
curl
OpenJDK package(depends on what version would you like to install.)'

echo 'The Setup is about to start. Please wait.'
sleep 5

read -p "Would you like to perform a clean installation? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo 'removing the TL folder in /usr/share'
    echo -r /home/$USER/.minecraft
    echo 'Finished performing clean installation.'
fi

sudo apt install curl -y
echo 'Creating directories for the Installation.'
sleep 1
echo 'Creating tl-installer folder on User Directory'
mkdir /home/$USER/tl-installer
echo 'installer folder is now created'
sleep 1
echo 'creating system-wide folder for TL on /usr/share'
sudo mkdir /usr/share/tl
echo 'System-wide folder is now created.'
sleep 1
echo 'Going to the installer file'
cd /home/$USER/tl-installer
sleep '2'
echo 'Checking Internet Connection.'
sleep 1
ping -i .25 localhost -c 10
curl https://download1326.mediafire.com/zrmxm22nxnig/0iqkulvn95a2vk3/TL_legacy.jar --output TL_legacy.jar
echo 'JAR File Downloaded and Installed.'
sleep 1
mkdir /home/$USER/tl-installer/contents
curl https://download942.mediafire.com/wuxdhdgsc9xg/eakiadeabnv9yd4/tl-legacy-contents.tar.gz --output tl-legacy-contents.tar.gz
echo 'Content Files now Downloaded and Installed.'
sleep 1
echo 'Extracting the contents.'
tar -xf tl-legacy-contents.tar.gz -C /home/$USER/tl-installer/contents
echo 'Removing the TL: Legacy Content Archive'
rm tl-legacy-contents.tar.gz
echo 'Copying the files...'
sudo cp TL_legacy.jar /usr/share/tl
echo 'JAR File copied on /usr/share/tl'
sleep 1
echo 'Copying Contents.'
cd contents
sudo cp remove-tl.sh /usr/share/tl
sudo mkdir /usr/share/tl/icon
sudo cp minecraft.png /usr/share/tl/icon
echo 'Copying .desktop files...'
sudo cp tl.desktop /usr/share/applications
sudo cp remove-tl.desktop /usr/share/applications
echo 'Desktop file copied on /usr/share/applications'
echo 'Setting the .desktop file to executable.'
sleep 0.2
sudo chmod +x /usr/share/applications/tl-legacy.desktop
sudo chmod +x /usr/share/applications/remove-tl.desktop
echo 'Desktop Files are now Executable'
sleep 1
read -p "What Java JDK Version Package would you like to install? [1]default-jdk [2]openjdk-17 [3]openjdk-18 [4]openjdk-19 [5]openjdk-8:" -n 1 -r

if [[ $REPLY =~ ^[1]$ ]]
then
    sudo apt install default-jdk

fi

if [[ $REPLY =~ ^[2]$ ]]
then
    sudo apt install openjdk-17-jdk

fi

if [[ $REPLY =~ ^[3]$ ]]
then
    sudo apt install openjdk-18-jdk
fi

if [[ $REPLY =~ ^[4]$ ]]
then
    sudo apt install openjdk-19-jdk
fi

if [[ $REPLY =~ ^[5]$ ]]
then
    sudo apt install openjdk-8-jdk
fi

sleep 2
echo
echo
echo 'TL: Legacy Installed Successfully! Clearing the installer folder.'
cd
rm /home/$USER/tl-installer -r
sleep 5
echo
echo
echo 'Installation finished succesffully. You can open the application from the menu.'
echo
echo
echo 'If you want to remove TL:Legacy, run "Remove TL" on the applications menu.'
