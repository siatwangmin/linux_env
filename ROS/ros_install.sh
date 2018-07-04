#!/bin/bash





echo "Set up Robotware ..............."

wget https://raw.githubusercontent.com/tonyrobotics/RoboWare/master/Studio/roboware-studio_1.1.0-1514335284_amd64.deb

sudo dpkg -i roboware-studio_1.1.0-1514335284_amd64.deb

rm roboware-studio_1.1.0-1514335284_amd64.deb

echo "Finish Robotware"

exit 0
