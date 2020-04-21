docker已运行容器添加或修改端口映射
====

推荐方法：
查看id 就是 容器的 hash_of_the_container 数值
docker inspect 容器名字
1
修改hostconfig.json
vim /var/lib/docker/containers/[hash_of_the_container]/hostconfig.json
1
在 hostconfig.json 里有 “PortBindings”:{} 这个配置项，可以改成 “PortBindings”:{“80/tcp”:[{“HostIp”:"",“HostPort”:“8080”}]}

修改config.v2.json
vim /var/lib/docker/containers/[hash_of_the_container]/config.v2.json
1
在 config.v2.json 里面添加一个配置项 “ExposedPorts”:{“80/tcp”:{}} , 将这个配置项添加到 “Tty”: true, 前面

最后重启 docker的守护进程 service docker restart
查看配置项已经修改成功
docker inspect 容器名
————————————————
版权声明：本文为CSDN博主「軒菡咿嘫」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/weixin_43106638/java/article/details/102902977
