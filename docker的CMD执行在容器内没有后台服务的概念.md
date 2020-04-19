

Docker 不是虚拟机，容器中的应用都应该以前台执行，而不是像虚拟机、物理机里面那样，

用 upstart/systemd 去启动后台服务，容器内没有后台服务的概念。

如果将 CMD 写为：

CMD service nginx start

然后发现容器执行后就立即退出了。甚至在容器内去使用 systemctl 命令结果却发现根本执

行不了。这就是因为没有搞明白前台、后台的概念，没有区分容器和虚拟机的差异，依旧在

以传统虚拟机的角度去理解容器。

对于容器而言，其启动程序就是容器应用进程，容器就是为了主进程而存在的，主进程退

出，容器就失去了存在的意义，从而退出，其它辅助进程不是它需要关心的东西。

而使用 service nginx start 命令，则是希望 upstart 来以后台守护进程形式启动 nginx 服

务。而刚才说了 CMD service nginx start 会被理解为 CMD [ "sh", "-c", "service nginx

start"] ，因此主进程实际上是 sh 。那么当 service nginx start 命令结束后， sh 也就结

束了， sh 作为主进程退出了，自然就会令容器退出。

正确的做法是直接执行 nginx 可执行文件，并且要求以前台形式运行。比如：

CMD ["nginx", "-g", "daemon off;"]

作者：Ppnn13Yu
链接：https://www.jianshu.com/p/f7d8699bed8e
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
