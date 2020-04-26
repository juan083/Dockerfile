docker-compose使用
====

#### 安装步骤
参考官方文档：https://docs.docker.com/compose/install/
```
1. 下载docker-compose二进制文件到/usr/local/bin/docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

2. 增加可执行权限+x
chmod +x /usr/local/bin/docker-compose

3. 添加软链接
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

4. 测试安装是否成功
docker-compose -v
```

### 常用命令
