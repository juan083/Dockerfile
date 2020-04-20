docker-compose使用
====

#### Compose 使用的三个步骤：
1. 使用 Dockerfile 定义应用程序的环境。
2. 使用 docker-compose.yml 定义构成应用程序的服务，这样它们可以在隔离环境中一起运行。
3. 最后，执行 docker-compose up 命令来启动并运行整个应用程序。

#### 参考文档：
https://docs.docker.com/compose/reference/build/

https://www.runoob.com/docker/docker-compose.html

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
