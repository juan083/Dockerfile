docker使用systemctl报错
=====

#### 在Docker容器使用systemctl启动进程时，报错
```
Failed to get D-Bus connection: Operation not permitted
```
#### 解决方法：
以特权模式运行容器，`docker run`增加参数`--privileged=true`

如在创建MySQL的容器时，命令如下：
```
docker run -d -name mysql8 --privileged=true mysql8_centos7 /usr/sbin/init

docker exec -it mysql8 /bin/bash
```

#### 原因：
Docker的设计理念是在容器里面不运行后台服务，容器本身就是宿主机上的一个独立的主进程。

一个容器的生命周期是围绕这个主进程存在的，所以正确的使用容器方法是将里面的服务运行在前台。

systemd维护系统服务程序，它需要特权去会访问Linux内核。

而容器并不是一个完整的操作系统，只有一个文件系统，默认启动以**普通用户**的权限访问Linux内核，也就是没有特权，所以就不能用systemctl命令。

使用特权启动`--privileged=true`，则可以使用`systemctl`。
