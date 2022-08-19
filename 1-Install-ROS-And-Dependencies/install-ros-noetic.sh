#!/bin/bash

echo ""
echo "[Nota] Target OS version  >>> Ubuntu 20.04.x (Focal Fossa) or Linux Mint 21.x"
echo "[Nota] Target ROS version >>> ROS Noetic Ninjemys"
echo "[Nota] Catkin workspace   >>> $HOME/catkin_ws"
echo ""
echo "PRESSIONE [ENTER] PARA CONTINUAR INSTALANDO"
echo "SE QUISER CANCELAR A OPERAÇÃO, CLIQUE [CTRL] + [C]"
read

echo "[Definir o OS, a versão do ROS e o nome do catkin workspace]"
name_os_version=${name_os_version:="focal"}
name_ros_version=${name_ros_version:="noetic"}
name_catkin_workspace=${name_catkin_workspace:="catkin_ws"}

echo "[Atualizando a Lista de Pacotes]"
sudo apt update -y

# wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_noetic.sh
# chmod /install_ros_noetic.sh 

echo "[Instalando BuildEenvironment, o Chrony, NTpdate and defininir o NTpdate]"
sudo apt install -y chrony ntpdate curl build-essential
sudo ntpdate ntp.ubuntu.com
# 1.3 Set up your Keys (Parte 1)

echo "[Adiciona o Repositorio do ROS]"
if [ ! -e /etc/apt/sources.list.d/ros-latest.list ]; then
  sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu ${name_os_version} main\" > /etc/apt/sources.list.d/ros-latest.list"
fi
  # 1.2 Setup your sources.list

echo "[Baixa as Chaves do ROS]"
roskey=`apt-key list | grep "Open Robotics"`
if [ -z "$roskey" ]; then
  curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
fi
# 1.3 Set up your Keys(Parte 2)

echo "[Check as Chaves do ROS]"
roskey=`apt-key list | grep "Open Robotics"`
if [ -n "$roskey" ]; then
  echo "[ROS key exists in the list]"
else
  echo "[Failed to receive the ROS key, aborts the installation]"
  exit 0
fi

echo "[Atualizando a Lista de Pacotes Novamente]"
sudo apt update -y
# 1.4 Installation(Parte 1)

echo "[Install ros-desktop-full version of Noetic"
sudo apt install -y ros-$name_ros_version-desktop-full
# 1.4 Installation(Parte 2)

echo "[Instalando RQT & Gazebo]"
sudo apt install -y ros-$name_ros_version-rqt-* ros-$name_ros_version-gazebo-*
# 1.4 Installation(Parte 5)

echo "[Setup Ambiente]" 
source /opt/ros/$name_ros_version/setup.sh
# 1.5 Environment Setup

echo "[Instalando rosinstall]"
sudo apt install -y python3-rosinstall python3-rosinstall-generator python3-wstool build-essential git
# 1.6 Dependencies for building package (Parte 1)

echo "[Instalando rosdep]"
sudo apt install python3-rosdep
# 1.6.1 Dependencies for building package (Parte 2)

echo "[Iniciando rosdep e  Update]"
sudo sh -c "rosdep init"
rosdep update
# 1.6.1 Dependencies for building package (Parte 3)

echo "[Construindo o catkin workspace e executando catkin_make]"
mkdir -p $HOME/$name_catkin_workspace/src
cd $HOME/$name_catkin_workspace/src
catkin_init_workspace
cd $HOME/$name_catkin_workspace
catkin_make

echo "[Definindo as Variáveis Ambientes do ROS]"

sh -c "echo \"alias eb='nano ~/.bashrc'\" >> ~/.bashrc"
sh -c "echo \"alias sb='source ~/.bashrc'\" >> ~/.bashrc"
sh -c "echo \"alias gs='git status'\" >> ~/.bashrc"
sh -c "echo \"alias gp='git pull'\" >> ~/.bashrc"
sh -c "echo \"alias cw='cd ~/$name_catkin_workspace'\" >> ~/.bashrc"
sh -c "echo \"alias cs='cd ~/$name_catkin_workspace/src'\" >> ~/.bashrc"
sh -c "echo \"alias cm='cd ~/$name_catkin_workspace && catkin_make'\" >> ~/.bashrc"

sh -c "echo \"source /opt/ros/$name_ros_version/setup.bash\" >> ~/.bashrc"
sh -c "echo \"source ~/$name_catkin_workspace/devel/setup.bash\" >> ~/.bashrc"

sh -c "echo \"export ROS_MASTER_URI=http://localhost:11311\" >> ~/.bashrc"
sh -c "echo \"export ROS_HOSTNAME=localhost\" >> ~/.bashrc"

source $HOME/.bashrc

echo "[Completo!!!]"
exit 0
