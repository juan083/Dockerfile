使用Dockerfile创建镜像与一键部署web环境
====

### 应用版本
应用 | 版本  
-|-
docker | 19.03.8
docker-compose | 1.25.5
centos | centos:7
nginx | 1.18.0
mysql | 8.0.19
php | 7.2
redis | 5.0.8

### 使用Dockerfile创建镜像

自动安装脚本`install_xxx.sh`的参数`1`，表示同时构建容器

#### 1. Dockerfile创建 MySQL8.0 镜像
[Dockerfile创建MySQL8.0](./Dockerfile创建MySQL8.0.md)
##### 安装命令
```
cd mysql
sh install_mysql.sh 1
```

MySQL安装完成后，还需修改root密码以及登录ip的限制
```
docker exec -ti 28612f88596e mysql -u root -p
use mysql;
update user set host='%' where user = 'root';
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
flush privileges;
```


#### 2. Dockerfile创建 Nginx1.16 镜像
[Dockerfile创建nginx1.16](./Dockerfile创建nginx1.16.md)
##### 安装命令
```
cd nginx
sh install_nginx.sh 1
```

#### 3. Dockerfile创建 PHP7.2 镜像
[Dockerfile创建php7](./Dockerfile创建php7.md)
##### 安装命令
```
cd php
sh install_php.sh 1
```

#### 4. Dockerfile创建 Redis5.0 镜像
[Dockerfile创建redis5](./Dockerfile创建redis5.md)
##### 安装命令
```
cd redis
sh install_redis.sh
```

以上的自动安装脚本，都包含了build Dockerfile镜像的操作、复制配置文件、run 容器

备注：容器的启动命令，建议使用shell脚本，这样有利于容器的调试

以上Dockerfile都使用entrypoint.sh作为启动脚本，并在entrypoint.sh写入启动的命令，如有需要，还可写入其他一些启动时的检测。这使得容器的启动更为灵活。

### 一键部署脚本

#### 1.一键安装docker、docker-compose、centos:7
[install_docker.sh](./install_docker.sh)
```
sh install_docker.sh
```

#### 2.一键部署lnmpr环境
**lnmpr环境**: 即基于centos7配置nginx、mysql、php、redis的环境

[install_lnmpr.sh](./install_lnmpr.sh)
```
sh install_docker.sh 1
```

#### 3.Docker Hub生成的镜像
将以上Dockerfile生成的镜像，上传到Docker Hub

##### 步骤：
1.登录Docker Hub
```
docker login
之后按提示，输入用户名和密码
如果看到 Login Succeeded ，则表示登录成功
```

2.将本地的镜像打个tag
```
docker tag [本地镜像名称]:[本地镜像版本] [Docker Hub的用户名]/[将要上传到Docker Hub的镜像名称]:[版本好]
```
如：
```
docker tag redis5-centos7:latest juan083/redis5-centos7:1.0
```

3.再上传本地镜像到Docker Hub
```
docker push 刚打的tag名称:版本
```
如：
```
docker push juan083/redis5-centos7:1.0
```

以下是提交到Docker Hub到镜像
##### [juan083/mysql8-mini-centos7](https://hub.docker.com/repository/docker/juan083/mysql8-mini-centos7)
##### [juan083/nginx1.16-centos7](https://hub.docker.com/repository/docker/juan083/nginx1.16-centos7)
##### [juan083/php72-centos7](https://hub.docker.com/repository/docker/juan083/php72-centos7)
##### [juan083/redis5-centos7](https://hub.docker.com/repository/docker/juan083/redis5-centos7)
