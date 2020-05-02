lnmpr环境搭建遇到的问题
====

1.nginx与fpm通信，nginx的错误日志error.log提示504错误
```
2020/05/02 21:25:24 [error] 10#10: *26 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 85.119.151.251, server: localhost, request: "POST http://check.best-proxies.ru/azenv.php?s=158842592407397PC199832996508080 HTTP/1.1", upstream: "fastcgi://172.19.0.4:9000", host: "check.best-proxies.ru", referrer: "https://best-proxies.ru/"
```
解决方法：
nginx与fpm通信失败，
将nginx配置修改
`fastcgi_pass   127.0.0.1:9000;`
改为内网地址，如
`fastcgi_pass   172.1.2.3:9000;`

问题查找：
修改php-fpm.d/www.conf
```
打开配置，去掉最前面的分号;(此配置是为了定位问题，非必要修改)
catch_workers_output = yes

去掉以下限制，在最前面增加分号;
;listen.allowed_clients

去掉soap配置
;php_value[soap.wsdl_cache_dir]  = /var/lib/php/wsdlcache

允许所有ip访问
listen = 127.0.0.1:9000 改为 listen = 9000
```

nginx和fpm都能访问php项目的代码，启动的时候做路径映射
```
docker run --name 容器名xxx \
    -v /var/www/:/var/www/ \
    -d 镜像名xxx
```
