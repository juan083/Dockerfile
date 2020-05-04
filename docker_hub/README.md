部署
====

### 步骤
#### 1.拉取Docker Hub镜像
```
docker pull juan083/mysql8-mini-centos7
```

#### 2.复制配置文件
```
cp -rf ../mysql/etc/ /
```

#### 3.docker-compose构建容器
```
docker-compose -f docker_hub_lnmpr.yml up -d mysql8
```
