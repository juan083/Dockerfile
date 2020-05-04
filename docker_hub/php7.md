Dockerfile创建php7
====

如果你觉得对你有帮助，请给颗星星✨鼓励下 [https://github.com/juan083/Dockerfile]

配置项 | 值  
-|-
系统 | centos7
php版本 | php7.2
配置 | `/etc/php.int`
扩展 | `/etc/php.d/`
fpm配置 | `/etc/php-fpm.conf`
fpm配置 | `/etc/php-fpm.d/`
log | `/var/log/php-fpm/`

### Dockerfile

[php Dockerfile](https://github.com/juan083/Dockerfile/tree/master/php/Dockerfile) : [https://github.com/juan083/Dockerfile/tree/master/php/Dockerfile](https://github.com/juan083/Dockerfile/tree/master/php/Dockerfile)

### 部署脚本
[部署脚本 https://github.com/juan083/Dockerfile/docker_hub/install.sh](https://github.com/juan083/Dockerfile/docker_hub/install.sh)

```
sh install.sh php
```

### 部署步骤
#### 1.拉取文件
```
git clone https://github.com/juan083/Dockerfile
```

#### 2.从Docker Hub拉取镜像
```
docker pull juan083/php72-centos7:1.0
```

#### 3.复制配置文件
```
cp -rf ./Dockerfile/php/etc/ /
```

#### 4.启动容器
##### 使用docker-compose构建容器
```
docker-compose -f docker_hub_lnmpr.yml up -d php72
```

[docker_hub_lnmpr.yml](https://github.com/juan083/Dockerfile/blob/master/docker_hub/docker_hub_lnmpr.yml): [https://github.com/juan083/Dockerfile/blob/master/docker_hub/docker_hub_lnmpr.yml](https://github.com/juan083/Dockerfile/blob/master/docker_hub/docker_hub_lnmpr.yml)

```
php72:
    image: juan083/php72-centos7
    container_name: "php72"
    ports:
      - "9000:9000"
    volumes:
      - /etc/php.int:/etc/php.int:ro
      - /etc/php.d/:/etc/php.d/:ro
      - /etc/php-fpm.conf:/etc/php-fpm.conf:ro
      - /etc/php-fpm.d/:/etc/php-fpm.d/:ro
      - /var/log/php-fpm/:/var/log/php-fpm/
      - /var/www/:/var/www/
    command: ./entrypoint.sh
```

##### docker命令构建容器
```
docker run --name php72 \
    -p 9000:9000 \
    -v /etc/php.ini:/etc/php.ini:ro \
    -v /etc/php.d/:/etc/php.d/:ro \
    -v //etc/php-fpm.conf:/etc/php-fpm.conf:ro \
    -v /etc/php-fpm.d/:/etc/php-fpm.d/:ro \
    -v /var/log/php-fpm/:/var/log/php-fpm/ \
    -v /var/www/:/var/www/ \
    -dit php72-centos7
```

#### 进入容器
```
docker exec -it php72 /bin/bash
```

#### 本镜像已安装的扩展
```
[root@1d764c6b1334 ~]# php -m
[PHP Modules]
bz2
calendar
Core
ctype
curl
date
dom
exif
fileinfo
filter
ftp
gd
gettext
gmp
hash
iconv
json
libxml
mbstring
mongodb
mysqli
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
redis
Reflection
session
shmop
SimpleXML
sockets
SPL
sqlite3
standard
sysvmsg
sysvsem
sysvshm
tokenizer
wddx
xml
xmlreader
xmlwriter
xsl
Zend OPcache
zip
zlib
```

#### 安装其他php扩展
1. 先查询有哪些扩展可安装 `pecl search xxx`
2. 执行安装命令 `pecl install xxx`
3. 将扩展加入配置文件 `echo "extension=xxx.so" > /etc/php.d/xxx.ini`

例如在本Dockfile中，安装的`redis`扩展
```
printf "no\nno\nno\nno\n" | pecl install redis \
&& echo "extension=redis.so" > /etc/php.d/redis.ini
```

#### php7.2可安装的扩展 `yum install xxx`
```
php72w
php72w-cli
php72w-common
php72w-devel
php72w-embedded
php72w-fpm
php72w-gd
php72w-mbstring
php72w-mysqlnd
php72w-opcache
php72w-pdo
php72w-xml
php72w
php72w-bcmath
php72w-dba
php72w-enchant
php72w-imap
php72w-interbase
php72w-intl
php72w-ldap
php72w-mcrypt
php72w-odbc
php72w-pdo_dblib
php72w-pear
php72w-pecl-apcu
php72w-pecl-imagick
php72w-pecl-xdebug
php72w-pgsql
php72w-phpdbg
php72w-process
php72w-pspell
php72w-recode
php72w-snmp
php72w-soap
php72w-tidy
php72w-xmlrpc
php72w-pecl-igbinary
php72w-intl
php72w-memcached
php72w-pecl-mongodb
```

如果你觉得对你有帮助，请给颗星星✨鼓励下 [https://github.com/juan083/Dockerfile]
