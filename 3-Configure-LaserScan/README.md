### Instalar Depências do ROS e LaserScan 

``` bash
sudo apt install ros-noetic-rtabmap-ros
```
``` bash
sudo apt-get install ros-noetic-depthimage-to-laserscan
```

```bash
echo export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/ros/noetic/lib/x86_64-linux-gnu >> ~/.bashrc
```

### Função para Ativar o LaserScan

``` bash
roslaunch freenect_launch freenect.launch
``` 
``` bash
rosrun depthimage_to_laserscan depthimage_to_laserscan image:=/camera/depth/image_raw
```
