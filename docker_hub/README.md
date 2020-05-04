部署
====

如果你觉得对你有帮助，请给颗星星✨鼓励下

### 步骤
#### 1.拉取Docker Hub镜像
```
docker pull juan083/mysql8-mini-centos7
```

#### 2.复制配置文件
```
cp -rf ./Dockerfile/mysql/etc/ /
```

#### 3.docker-compose构建容器
```
docker-compose -f docker_hub_lnmpr.yml up -d mysql8
```

### 参考脚本
[部署脚本](./install.sh)

带上参数（mysql、nginx、php、redis）
```
sh install.sh mysql
```

如果你觉得对你有帮助，请给颗星星✨鼓励下
