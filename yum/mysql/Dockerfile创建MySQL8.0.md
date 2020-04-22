Dockerfile创建MySQL8.0
====

配置项 | 值  
-|-
系统 | centos7
MySQL版本 | MySQL8.0
port | 3306
etc | `/etc/my.cnf`
etc | `/etc/my.cnf.d/`
data | `/var/lib/mysql/`
log | `/var/log/mysqld.log`
pid | `/var/run/mysqld/mysqld.pid`

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

#### 获取初始密码
```
grep 'temporary password' /var/log/mysqld.log
```

#### 修改密码
```
mysql -uroot -p
ALTER USER 'root'@'localhost' IDENTIFIED BY 'juan083@163.com';

```
#### 初始化数据库
```
mysqld --initialize --user=mysql --datadir=/var/lib/mysql
```

#### docker-compose


在宿主机创建持久化 mysql data 及mysql.cnf

docker run \
    --name mysql8 \
    --privileged=true \
    -p 3306:3306 \
    -v /var/lib/mysql:/var/lib/mysql:rw \
    -v /var/log/mysqld.log:/var/log/mysqld.log \
    -v /etc/my.cnf:/etc/my.cnf \
    -v /etc/my.cnf.d/:/etc/my.cnf.d/:rw \
    --restart=always \
    -d mysql

docker run --name mysql8_test_3 -dit --privileged=true mysql8-centos7_test3


1. 可能是log没有写入权限
2. 启动的进程需改为前台执行

service mysqld start
/bin/systemctl start mysqld.service
systemctl status mysqld.service

/usr/lib/systemd/system/mysqld.service

无法启动，报错解决：
rm -rf /var/lib/mysql
service mysqld start
service mysqld stop

/usr/sbin/mysqld $MYSQLD_OPTS


  -r, --chroot=name   Chroot mysqld daemon during startup.
  -D, --daemonize     Run mysqld as sysv daemon
  -u, --user=name     Run mysqld daemon as user.
daemonize                                                    FALSE



111

mysqld -u mysql
rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

mysqld -u mysql -install
mysqld -u mysql
