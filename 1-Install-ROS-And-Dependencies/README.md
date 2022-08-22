# ROS-AraraBots-HOME-2022


## Install ROS and Depencies


### Script de Instalação
``` bash
$ cd ~/"1-Install-ROS-And-Dependencies"
```
``` bash
$ chmod +x install-ros-noetic.sh
```
``` bash
$ ./install-ros-noetic.sh
```


### Instalando Dependências dos Pacotes ROS

``` bash
$ sudo apt-get install ros-noetic-joy ros-noetic-teleop-twist-joy \
  ros-noetic-teleonoeticp-twist-keyboard ros-noetic-laser-proc \
  ros-noetic-rgbd-launch ros-noetic-depthimage-to-laserscan \
  ros-noetic-rosserial-arduino ros-noetic-rosserial-python \
  ros-noetic-rosserial-server ros-noetic-rosserial-client \
  ros-noetic-rosserial-msgs ros-kinetic-amcl ros-noetic-map-server \
  ros-noetic-move-base ros-kinetic-urdf ros-noetic-xacro \
  ros-noetic-compressed-image-transport ros-noetic-rqt* \
  ros-noetic-gmapping ros-kinetic-navigation ros-noetic-interactive-markers
```
### Instalando Pacotes do TurtleBot

```bash
$ sudo apt-get install ros-noetic-dynamixel-sdk
```
```bash
$ sudo apt-get install ros-noetic-turtlebot3-msgs
```
```bash
$ sudo apt-get install ros-noetic-turtlebot3
```
