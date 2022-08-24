# ROS-AraraBots-HOME-2022


## Install LibFreenect

``` bash
$ sudo apt-get install ros-noetic-rgbd-launch
```

### Instalando Dependências dos Pacotes ROS

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install git-core cmake freeglut3-dev pkg-config build-essential libxmu-dev libxi-dev libusb-1.0-0-dev
```

``` bash
$ cd ~/src
$ git clone git://github.com/OpenKinect/libfreenect.git
$ cd libfreenect
$ mkdir build
$ cd build
$ cmake -L ..
$ make
$ sudo make install
$ sudo ldconfig /usr/local/lib64/
```

### Teste do Kinect
``` bash
freenect-glview
```
