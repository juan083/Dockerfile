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
命令 | 作用
-|- 
docker-compose up -d xxx | 以守护进程模式，构建容器xxx运行加-d选项
docker-compose -f YML文件 up -d xxx | 指定配置文件
docker-compose ps -a | 显示所有容器
docker-compose restart xxx | 重新启动xxx容器
docker-compose stop xxx | 停止xxx容器
docker-compose start xxx | 启动xxx容器
docker-compose exec xxx /bin/bash | 登录到nginx容器中
docker-compose down	xxx | 删除所有nginx容器,镜像
docker-compose build xxx | 构建镜像
docker-compose build --no-cache xxx | 不带缓存的构建
docker-compose logs xxx | 查看xxx的日志
docker-compose logs -f xxx | 查看xxx的实时日志
docker-compose config  -q | 验证（docker-compose.yml）文件配置，当配置正确时，不输出任何内容，当文件配置错误，输出错误信息
docker-compose pause xxx | 暂停xxx容器
docker-compose unpause xxx | 恢复xxx容器
docker-compose rm xxx | 删除容器（删除前必须关闭容器）
