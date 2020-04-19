Dockerfile创建Redis5
====

配置项 | 值  
-|-
系统 | centos7
redis版本 | 5.0.8
redis配置 | `/etc/redis/redis.conf`
redis路径 | `/usr/local/redis`

#### 创建镜像
```
docker build -t redis5-centos7 .
```

#### 启动容器
```
docker run --name redis5 -dit redis5-centos7 /bin/bash
```

#### 进入容器
```
docker exec -it redis5 /bin/bash
```

#### 常量
配置项 | 值  
-|-
DOWNLOAD_URL | 下载链接，默认`http://download.redis.io/releases/redis-5.0.8.tar.gz`
REDIS_PW | redis密码，默认`123456`
