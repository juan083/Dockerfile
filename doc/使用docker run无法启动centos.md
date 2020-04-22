为什么使用docker run无法启动centos
====

`sudo docker run -d centos /bin/bash`创建容器之后，使用`docker ps -a`发现容器已经停止，再使用`docker start id`启动容器之后,观察`docker ps -a`的操作时间，发现容器其实已经启动过，但是马上就停止了。这是什么原因？

补充：尝试三种镜像的启动，centos,mysql,nginx,结果只有nginx能启动。其他两个怎么也启动不了。


补充二:问题基本已经找到了，原因就是：Docker容器后台运行,就必须有一个前台进程。主线程结束，容器会退出。
sudo docker run -d centos 改成 sudo docker -dit centos 就行了。
