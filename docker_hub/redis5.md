Dockerfile创建Redis5
====

如果你觉得对你有帮助，请给颗星星✨鼓励下 [https://github.com/juan083/Dockerfile]

配置项 | 值  
-|-
系统 | centos7
redis版本 | 5.0.8
redis配置 | `/etc/redis/redis.conf`
redis路径 | `/usr/local/redis`
log | `/var/log/redis/redis.log`(可自定义，修改配置文件的logfile值)

### Dockerfile

[Redis Dockerfile](https://github.com/juan083/Dockerfile/tree/master/redis/Dockerfile) : [https://github.com/juan083/Dockerfile/tree/master/redis/Dockerfile](https://github.com/juan083/Dockerfile/tree/master/redis/Dockerfile)

### 部署脚本
[部署脚本 https://github.com/juan083/Dockerfile/docker_hub/install.sh](https://github.com/juan083/Dockerfile/docker_hub/install.sh)

```
sh install.sh redis
```

### 部署步骤
#### 1.拉取文件
```
git clone https://github.com/juan083/Dockerfile
```

#### 2.从Docker Hub拉取镜像
```
docker pull juan083/redis5-centos7:1.0
```

#### 3.复制配置文件
```
cp -rf ./Dockerfile/redis/etc/ /
```

#### 4.启动容器
##### 使用docker-compose构建容器
```
docker-compose -f docker_hub_lnmpr.yml up -d redis5
```

[docker_hub_lnmpr.yml](https://github.com/juan083/Dockerfile/blob/master/docker_hub/docker_hub_lnmpr.yml): [https://github.com/juan083/Dockerfile/blob/master/docker_hub/docker_hub_lnmpr.yml](https://github.com/juan083/Dockerfile/blob/master/docker_hub/docker_hub_lnmpr.yml)

```
redis5:
    image: juan083/redis5-centos7
    container_name: "redis5"
    ports:
      - "6379:6379"
      - "6380:6380"
    volumes:
      - /etc/redis/:/etc/redis/:ro
      - /var/log/redis/:/var/log/redis/
    command: ./entrypoint.sh
```

##### docker命令构建容器
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
##### 1.外网可以访问

`protected-mode yes` 改成 `protected-mode no`

`bind 127.0.0.1` 改成 `#bind 127.0.0.1`

##### 2.增加redis的密码

增加`requirepass 123456`

##### 3.修改redis的日志

`logfile` 修改 `logfile "/var/log/redis/redis.log"`

如果你觉得对你有帮助，请给颗星星✨鼓励下 [https://github.com/juan083/Dockerfile]
