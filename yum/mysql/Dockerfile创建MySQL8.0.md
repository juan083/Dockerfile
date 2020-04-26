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
docker run --name mysql8 \
    --privileged=true \
    -p 3306:3306 \
    -v /var/lib/mysql:/var/lib/mysql:rw \
    -v /var/log/mysqld.log:/var/log/mysqld.log \
    -v /etc/my.cnf:/etc/my.cnf \
    -v /etc/my.cnf.d/:/etc/my.cnf.d/ \
    -d mysql8-centos7


   docker run --name mysql8 -d centos:7
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
# 如果可以连上数据库，可使用以下方式修改
mysql -uroot -p
ALTER USER 'root'@'localhost' IDENTIFIED BY 'juan083@163.com';

# 如果链接不上数据库，如提示“ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' (111)”
# 则通过docker exec进去容器修改数据
docker exec -ti 28612f88596e mysql -u root -p
update user set host='%' where user = 'root';
flush privileges;
```

#### 初始化数据库
```
mysqld --initialize --user=mysql --datadir=/var/lib/mysql
```

#### docker-compose
```
mysql8:
    image: mysql8-centos7
    network_mode: "host"
    container_name: "mysql8"
    ports:
      - "3306:3306"
    volumes:
      - /var/lib/mysql:/var/lib/mysql
      - /var/log/mysqld.log:/var/log/mysqld.log
      - /etc/my.cnf:/etc/my.cnf:ro
      - /etc/my.cnf.d/:/etc/my.cnf.d/:ro
    command: mysqld
```
