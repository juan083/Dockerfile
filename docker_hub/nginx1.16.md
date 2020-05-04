Dockerfile创建nginx1.16
====

配置项 | 值  
-|-
系统 | centos7
nginx版本 | 1.16
nginx配置 | `/etc/nginx/nginx.conf`
- | `/etc/nginx/conf.d/*.conf`
访问日志 | `/var/log/nginx/access.log`
错误日志 | `/var/log/nginx/error.log`
web项目 | `/var/www/`

### Dockerfile

[nginx Dockerfile](https://github.com/juan083/Dockerfile/tree/master/nginx/Dockerfile) : [https://github.com/juan083/Dockerfile/tree/master/nginx/Dockerfile](https://github.com/juan083/Dockerfile/tree/master/nginx/Dockerfile)

### 部署步骤
#### 1.拉取文件
```
git clone https://github.com/juan083/Dockerfile
cd ./Dockerfile/nginx
```

#### 2.从Docker Hub拉取镜像
```
docker pull juan083/nginx1.16-centos7
```

#### 3.复制配置文件
```
cp -rf ./Dockerfile/nginx/etc/ /
```

#### 4.启动容器
##### 使用docker-compose构建容器
```
docker-compose -f docker_hub_lnmpr.yml up -d nginx1.16
```

[docker_hub_lnmpr.yml](https://github.com/juan083/Dockerfile/blob/master/docker_hub/docker_hub_lnmpr.yml): [https://github.com/juan083/Dockerfile/blob/master/docker_hub/docker_hub_lnmpr.yml](https://github.com/juan083/Dockerfile/blob/master/docker_hub/docker_hub_lnmpr.yml)

```
nginx1.16:
    image: juan083/nginx1.16-centos7
    container_name: "nginx1.16"
    ports:
      - "80:80"
      - "90:90"
      - "443:443"
      - "8080:8080"
    volumes:
      - /var/www:/var/www/
      - /var/log/nginx/:/var/log/nginx/
      - /etc/nginx/nginx.conf:/etc/nginx/nginx.conf:ro
      - /etc/nginx/conf.d/:/etc/nginx/conf.d/:ro
    command: ./entrypoint.sh
```

##### docker命令构建容器
```
docker run --name nginx1.16  \
--privileged=true \
-p 80:80 \
-p 90:90 \
-p 443:443 \
-p 8080:8080 \
-v /var/www/:/var/www/ \
-v /var/log/nginx/:/var/log/nginx/ \
-v /etc/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
-v /etc/nginx/conf.d/:/etc/nginx/conf.d/:ro \
-d nginx1.16-centos7
```

#### 进入容器
```
docker exec -it nginx1.16 /bin/bash
```

#### 已安装的nginx详情
```
root@428b5ab32bb9 /]# nginx -V
nginx version: nginx/1.16.1
built by gcc 4.8.5 20150623 (Red Hat 4.8.5-36) (GCC)
built with OpenSSL 1.0.2k-fips  26 Jan 2017
TLS SNI support enabled
configure arguments: --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib64/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-compat --with-file-aio --with-threads --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_flv_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_mp4_module --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module --with-http_sub_module --with-http_v2_module --with-mail --with-mail_ssl_module --with-stream --with-stream_realip_module --with-stream_ssl_module --with-stream_ssl_preread_module --with-cc-opt='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic -fPIC' --with-ld-opt='-Wl,-z,relro -Wl,-z,now -pie'
```
