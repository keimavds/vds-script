#!/bin/bash
mkdir -p  ~/myscript
chmod 777 ~/myscript/
touch  ~/myscript/rosinstall.sh
sudo chmod +x ~/myscript/rosinstall.sh
cat << EOU >~/myscript/rosinstall.sh
locale  # check for UTF-8
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # verify settings
sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt install ros-dev-tools
sudo apt update
sudo apt upgrade
sudo apt install ros-rolling-desktop
sudo apt install ros-rolling-ros-base
echo "cd /opt/ros/rolling" >>~/.bashrc
echo "source /opt/ros/rolling/setup.bash" >>~/.bashrc
gnome-terminal -- bash -c "cd /opt/ros/rolling; source /opt/ros/rolling/setup.bash; ros2 run demo_nodes_py listener; exec bash"
#gnome-terminal -- sh -c "bash -c \"cd /opt/ros/rolling; source /opt/ros/rolling/setup.bash; ros2 run demo_nodes_py listener; $SHELL; exec bash\"" 
cd /opt/ros/rolling
source /opt/ros/rolling/setup.bash
ros2 run demo_nodes_cpp talker
EOU
sudo bash ~/myscript/rosinstall.sh

