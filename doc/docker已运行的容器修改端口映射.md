docker已运行容器添加或修改端口映射
====

查看id 就是 容器的 hash_of_the_container 数值
docker inspect 容器名字
1

- 1.查看容器ID，修改hostconfig.json
```
vim /var/lib/docker/containers/[容器id]/hostconfig.json
如：
vim /var/lib/docker/containers/a0ce12370b6c24796598e74c7264084491f9cad52f49e7ddbc148825b1ab26e1/hostconfig.json

# PortBindings”:{......} 这个配置项修改成你所需要的
```

- 2.修改config.v2.json
```
vim /var/lib/docker/containers/[hash_of_the_container]/config.v2.json
如：
vim /var/lib/docker/containers/a0ce12370b6c24796598e74c7264084491f9cad52f49e7ddbc148825b1ab26e1/config.v2.json

在 config.v2.json 里面添加一个配置项 “ExposedPorts”:{“80/tcp”:{}} , 将这个配置项添加到 “Tty”: true前面
```

- 3.最后重启 docker的守护进程 `service docker restart`

- 4.查看配置项已经修改成功
```
docker inspect 容器名
```
