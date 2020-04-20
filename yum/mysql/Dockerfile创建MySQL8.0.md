Dockerfile创建MySQL8.0
====

配置项 | 值  
-|-
系统 | centos7
MySQL版本 | MySQL8.0
port | 3306
etc | `/etc/my.cnf`
- | `/etc/my.cnf.d/`
data | `/var/lib/mysql/`
log | `/var/log/mysqld.log`
初始密码 | `grep 'temporary password' /var/log/mysqld.log`

#### 创建镜像
```
docker build -t mysql8-centos7 .
```

#### 启动容器(以特权模式运行)
```
docker run --name mysql8 -dit --privileged=true mysql8-centos7 /usr/sbin/init
```

#### 进入容器
```
docker exec -it mysql8 /bin/bash
```

#### docker-compose
docker run --name mysql5.5 -p 3308:3306 -v ./conf:/etc/mysql/conf.d -v ./logs:/logs -v ./data:/var/lib/mysql -e MYSQL\_ROOT\_PASSWORD=123 -d mysql/mysql-server:5.5
--name 容器名字
-p 3308:3306 物理机端口：容器内部端口
-e 运行参数 初始化 root 用户的密码
-d 后台运行 mysql/mysql-server:5.5 下载的镜像名字加标签
-v ./conf:/etc/mysql/conf.d：将主机当前目录下的 conf/my.cnf 挂载到容器的 /etc/mysql/my.cnf。//配置文件目录
-v ./logs:/logs：将主机当前目录下的 logs 目录挂载到容器的 /logs。//日志目录
-v ./data:/var/lib/mysql ：将主机当前目录下的data目录挂载到容器的 /var/lib/mysql 。//数据库文件存放目录

在宿主机创建持久化 mysql data 及mysql.cnf

docker run \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -v /home/data/mysql/data:/var/lib/mysql:rw \
    -v /home/data/mysql/log:/var/log/mysql:rw \
    -v /home/data/mysql/config/my.cnf:/etc/mysql/my.cnf:rw \
    -v /etc/localtime:/etc/localtime:ro \
    --name mysql8 \
    --restart=always \
    -d mysql
