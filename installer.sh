#!/bin/bash
# Cutefish installer for FreeBSD
#
# Display permissions warning
echo ''
echo 'Reminder: make sure you run this script as root!'
echo 'This script is supposed to be ran on a clean install of FreeBSD with GPU drivers installed.'
echo 'This script will overwrite your shell rc files, make a backup of them if you have any modifications in it!'
echo ''
echo 'Starting in 10 seconds'
echo ''
sleep 10
# Create working directory
mkdir /tmp/cutefish/
cd /tmp/cutefish/
# Install dependencies
echo ''
echo 'Installing dependencies...'
echo ''
sleep 5
pkg install git qt5 kf5-kcoreaddons kf5-extra-cmake-modules plasma5-kwin cmake qt5ct bash xorg-minimal
sleep 5
echo ''
echo 'Downloading modified sources...'
echo ''
fetch https://0x0.st/ovUv.zip
mv ./ovUv.zip /tmp/cutefish/sources.zip
unzip /tmp/cutefish/sources.zip
echo ''
echo 'Compiling core...'
echo ''
sleep 5
cd core
mkdir build
cd build
cmake ..
make
make install
cd /tmp/cutefish
echo ''
echo 'Compiling FishUI library...'
echo ''
cd fishui
mkdir build
cd build
cmake ..
make
make install
cd /tmp/cutefish
echo ''
echo 'Compiling libcutefish...'
echo ''
cd libcutefish
mkdir build
cd build
cmake ..
make
make install
cd /tmp/cutefish/
echo ''
echo 'Installing GTK theme...'
echo ''
cd gtk-themes
mkdir build
cd build
cmake ..
make
make install
cd /tmp/cutefish
echo ''
echo 'Compiling settings...'
echo ''
cd settings
mkdir build
cd build
cmake ..
make
make install
cd /tmp/cutefish
echo ''
echo 'Extracting wallpapers...'
echo ''
cd wallpapers
mkdir build
cd build
cmake ..
make
make install
cd /tmp/cutefish
echo ''
echo 'Compiling application launcher..."
echo ''
cd launcher
mkdir build
cd build
cmake ..
make 
make install
cd /tmp/cutefish
echo ''
echo 'Compiling global menu bar..."
echo ''
cd statusbar
mkdir build
cd build
cmake ..
make
make install
cd /tmp/cutefish
echo ''
echo 'Downloading unmodified sources..."
echo ''
git clone https://github.com/cutefishos/dock
git clone https://github.com/cutefishos/filemanager
git clone https://github.com/cutefishos/icons
echo ''
echo 'Installing icon theme..."
echo ''
cd icons
mkdir build
cd build
cmake ..
make
make install
cd /tmp/cutefish
echo ''
echo 'Compiling file manager...'
echo ''
cd filemanager
mkdir build
cd build
cmake ..
make
make install
echo /tmp/cutefish
echo ''
echo 'Compiling dock...'
echo ''
cd dock
mkdir build
cd build
cmake ..
make
make install
cd /tmp/cutefish
echo ''
echo 'Patching system...'
echo ''
echo 'bash ~/cutefish-launcher.sh & cutefish-session' > ~/.xinitrc
fetch https://0x0.st/ov0i.sh
mv ./ov0i.sh ~/cutefish-launcher.sh
echo ''
echo 'The installation is almost finished, but you have to do the last step by yourself!'
echo ''
echo 'QT5CT will open and you will have to set the default icon theme to Crule.'
echo ''
sleep 5
export QT_QPA_PLATFORMTHEME=qt5ct
QT_QPA_PLATFORMTHEME=qt5ct qt5ct
qt5ct
echo 'Installation should be finished now! Start Cutefish by running startx in the console'
echo ''


