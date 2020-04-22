docker容器执行cmd进程无法自动启动
=====

#### docker的CMD执行在容器内没有后台服务的概念

Docker容器中的应用都应该以**前台执行**

用 `upstart/systemd` 去启动后台服务，因容器内没有后台服务的概念，容器会自动的退出。

如CMD 写为：`CMD service nginx start`，然后发现容器执行后就立即退出了。

甚至在容器内去使用 `systemctl` 命令结果却发现根本执行不了。

这就是因为对于容器而言，其启动程序就是容器应用进程，容器就是为了主进程而存在的。

主进程退出，容器就失去了存在的意义，从而退出，其它辅助进程不是它需要关心的东西。

`CMD service nginx start` 命令，则是 upstart 以*后台守护进程形式*启动 `nginx` 服务。

会被理解为 `CMD [ "sh", "-c", "service nginx start"]`，因此主进程实际上是 sh。

那么当 `service nginx start` 命令结束后， sh 也就结束了， sh 作为主进程退出了，自然就会令容器退出。

正确的做法是直接执行 `nginx` 可执行文件，并且要求**以前台形式运行**。
比如：
```
CMD ["nginx", "-g", "daemon off;"]
```
