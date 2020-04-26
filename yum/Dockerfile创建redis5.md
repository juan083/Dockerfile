Dockerfile创建Redis5
====

配置项 | 值  
-|-
系统 | centos7
redis版本 | 5.0.8
redis配置 | `/etc/redis/redis.conf`
redis路径 | `/usr/local/redis`
log | `/var/log/redis/redis.log`(可自定义，修改配置文件的logfile值)

#### 创建镜像
```
docker build -t redis5-centos7 .
```

#### 启动容器
```
docker run --name redis5 \
    -p 6379:6379 \
    -v /etc/redis/:/etc/redis/:ro \
    -v /var/log/redis/:/var/log/redis/ \
    -d redis5-centos7
```

#### 进入容器
```
docker exec -it redis5 /bin/bash
```

#### 常量
配置项 | 值  
-|-
DOWNLOAD_URL | 下载链接，默认`http://download.redis.io/releases/redis-5.0.8.tar.gz`

#### 修改redis配置/etc/redis/redis.conf
- 1.外网可以访问

`protected-mode yes` 改成 `protected-mode no`

`bind 127.0.0.1` 改成 `#bind 127.0.0.1`

- 2.增加redis的密码

增加`requirepass 123456`

- 3.修改redis的日志

`logfile` 修改 `logfile "/var/log/redis/redis.log"`
