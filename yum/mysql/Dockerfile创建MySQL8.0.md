Dockerfile创建MySQL8.0
====

配置项 | 值  
-|-
系统 | centos7
MySQL版本 | 8.0
nginx配置 | `/etc/php.int`
 - | `/etc/nginx/conf.d/*.conf`


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

#### 已安装的nginx详情
```

```
