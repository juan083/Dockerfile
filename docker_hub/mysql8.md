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

### Dockerfile

[Redis Dockerfile](https://github.com/juan083/Dockerfile/tree/master/redis/Dockerfile) : [https://github.com/juan083/Dockerfile/tree/master/redis/Dockerfile](https://github.com/juan083/Dockerfile/tree/master/redis/Dockerfile)

### 部署步骤
#### 1.拉取文件
```
git clone https://github.com/juan083/Dockerfile
cd ./Dockerfile/mysql
```

#### 2.本地build镜像或从Docker Hub拉取镜像
##### 本地build镜像
```
docker build -t mysql8-centos7 .
```

##### 从Docker Hub拉取镜像
```
docker pull juan083/mysql8-mini-centos7
```

#### 3.复制配置文件
```
cp -rf ./Dockerfile/mysql/etc/ /
```

#### 4.启动容器
##### 使用docker-compose构建容器
```
docker-compose -f docker_hub_lnmpr.yml up -d mysql8
```

[mysql8.yml](https://github.com/juan083/Dockerfile/blob/master/docker_hub/mysql8.yml): [https://github.com/juan083/Dockerfile/blob/master/docker_hub/mysql8.yml](https://github.com/juan083/Dockerfile/blob/master/docker_hub/mysql8.yml)

```
mysql8:
    image: juan083/mysql8-mini-centos7
    container_name: "mysql8"
    ports:
      - "3306:3306"
    volumes:
      - /var/log/mysqld.log:/var/log/mysqld.log
    command: ./entrypoint.sh
```

##### docker命令构建容器
```
docker run --name mysql8 \
    --privileged=true \
    -p 3306:3306 \
    -v /var/log/mysqld.log:/var/log/mysqld.log \
    -d mysql8-centos7
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
# mysql8 默认使用caching_sha2_password的身份验证机制，php不支持
ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
# 使用mysql_native_password的身份验证机制
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';

# 如果链接不上数据库，如提示“ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' (111)”
# 则通过docker exec进去容器修改数据
docker exec -ti 28612f88596e mysql -u root -p
use mysql;
update user set host='%' where user = 'root';
flush privileges;
```

#### 初始化数据库
```
mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql
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
      - /var/log/mysqld.log:/var/log/mysqld.log
    command: mysqld
```

#### 修改配置文件
```
# 将配置文件my.cnf先复制出来
docker cp {container id}:/etc/my.cnf ./

# 修改my.cnf
vim my.cnf

# 将配置文件复制到容器内
docker cp ./my.cnf {contariner id}:/etc/my.cnf

# 重启容器
docker-compose restart {container id}
```
