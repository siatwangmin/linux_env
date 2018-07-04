#!/bin/bash

echo "start installing......"

sudo apt-get update

sudo apt-get install vim

sudo apt-get install openssh-server

sudo apt-get install git 

sudo apt install -f $PWD/nomachine_6.2.4_1_amd64.deb

#install remote 
sudo apt install -f $PWD/teamviewer_13.1.8286_amd64.deb 

#sudo teamviewer daemon disable
#sudo systemctl daemon-reload
#sudo teamviewer daemon enable
#sudo systemctl enable teamviewerd.service
#sudo systemctl start teamviewerd.service


sudo apt install xorg-video-abi-20 xserver-xorg-core
sudo apt install  xserver-xorg-video-dummy

#sudo wget -P /etc/X11 https://gist.githubusercontent.com/mangoliou/ba126832f2fb8f86cc5b956355346038/raw/b6ad063711226fdd6413189ad905943750d64fd8/xorg.conf
sudo cp $PWD/xorg.conf /etc/X11/

sudo /usr/NX/bin/nxserver   --useredit ${USER}  --screensharing yes


#git clone https://github.com/IntelRealSense/librealsense.git


sudo apt-get install libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev

sudo apt-get install libglfw3-dev

#./scripts/patch-realsense-ubuntu-lts.sh

#wget https://cmake.org/files/v3.12/cmake-3.12.0-rc2-Linux-x86_64.sh
#sudo ./cmake-3.12.0-rc2-Linux-x86_64.sh

tar -xf cmake-3.12.0-rc2-Linux-x86_64.tar.gz
#cd cmake-3.12.0-rc2-Linux-x86_64

sudo cp -r cmake-3.12.0-rc2-Linux-x86_64/bin cmake-3.12.0-rc2-Linux-x86_64/share /usr/
sudo cp -r cmake-3.12.0-rc2-Linux-x86_64/doc cmake-3.12.0-rc2-Linux-x86_64/man /usr/share/
rm -r cmake-3.12.0-rc2-Linux-x86_64

cp librealsense.tar.gz /home/$USER/
cd /home/$USER/
tar -xf librealsense.tar.gz 
rm librealsense.tar.gz
cd /home/$USER/librealsense
rm -r build

sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && udevadm trigger

mkdir build && cd build

cmake ../ -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=true
make
sudo make install 

#cd /home/$USER/librealsense/build
#/home/parobot/librealsense/build/examples/capture

./examples/capture/rs-capture

echo "Succuss!!!!!!!!!"

exit 0
