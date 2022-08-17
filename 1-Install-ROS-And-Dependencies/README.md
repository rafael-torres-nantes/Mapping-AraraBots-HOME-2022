# ROS-AraraBots-HOME-2022


## Install ROS and Depencies


### Script de Instalação
``` bash
$ cd "1-Install-ROS-And-Dependencies"
```
``` bash
$ chmod +x install-ros-noetic.sh
```
``` bash
$ ./install-ros-noetic.sh
```


### Instalando Dependências dos Pacotes ROS

``` bash
$ sudo apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy \
  ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc \
  ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan \
  ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python \
  ros-kinetic-rosserial-server ros-kinetic-rosserial-client \
  ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server \
  ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro \
  ros-kinetic-compressed-image-transport ros-kinetic-rqt* \
  ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers
```
### Instalando Pacotes do TurtleBot

```bash
$ sudo apt-get install ros-kinetic-dynamixel-sdk
```
```bash
$ sudo apt-get install ros-kinetic-turtlebot3-msgs
```
```bash
$ sudo apt-get install ros-kinetic-turtlebot3
```
