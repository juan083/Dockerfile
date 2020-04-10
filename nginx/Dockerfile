# 基础镜像
FROM centos:latest

# 维护者信息
MAINTAINER juan083@163.com

# 指定环境变量
ENV TIME_ZOME Asia/Shanghai

# 定义创建镜像过程中使用的变量
# 在执行docker build时，可以通过--build-arg[=]来为变量赋值覆盖ARG。多个值 --build-arg a=1 --build-arg b=2
# 当镜像编译成功后，ARG指定的变量将不再存在

# php下载链接()
ARG PHP_URL="https://www.php.net/distributions/php-7.2.29.tar.gz"
ARG PHP_PATH="/usr/local/php"
ARG PHP_ETC="/etc/php/php.ini"

# 镜像操作 开始...

# 添加内容到镜像
# ADD $PV.tar.gz /tmp

# 运行指定命令
RUN groupadd www && useradd -r -g www -s /bin/false www \
    && mkdir -p /tmp/php/ \
    && cd /tmp/php/ \
    && yum -y install gcc gcc-c++ make gd-devel libxml2-devel libcurl-devel libjpeg-devel libpng-devel openssl-devel bison \
    && curl -O ${PHP_URL} \
    && filename_list=(${PHP_URL//\// }) \
    && tar_file=${filename_list[-1]} \
    && tar -zxvf ${tar_file} \
    && php_file=(${tar_file//./ }) \
    && rm ${tar_file} \
    && cd ./${php_file}* \
    && ./configure --prefix=${PHP_PATH} --with-config-file-path=${PHP_ETC} \
    --enable-mbstring --with-openssl --enable-ftp --with-gd --with-jpeg-dir=/usr \
    --with-png-dir=/usr --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-pear \
    --enable-sockets --with-freetype-dir=/usr --with-zlib --with-libxml-dir=/usr \
    --with-xmlrpc --enable-zip --enable-fpm --enable-xml --enable-sockets --with-gd \
    --with-zlib --with-iconv --enable-zip --with-freetype-dir=/usr/lib/ --enable-soap \
    --enable-pcntl --enable-cli --with-curl --disable-fileinfo \
    && make \
    && make install \
    && cp ${PHP_PATH}/etc/php-fpm.conf.default ${PHP_PATH}/etc/php-fpm.conf \
    && cp ${PHP_PATH}/etc/php-fpm.d/www.conf.default ${PHP_PATH}/etc/php-fpm.d/www.conf \
    && sed -i '/;daemonize/a\daemonize = no' ${PHP_PATH}/etc/php-fpm.conf \
    && sed -i 's/127.0.0.1/0.0.0.0/g' ${PHP_PATH}/etc/php-fpm.d/www.conf \
    && echo "${TIME_ZOME}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TIME_ZOME} /etc/localtime \
    && rm -rf /tmp/php \
    && yum clean all \
    && yum -y remove gcc gcc-c++ make

# 镜像操作 结束...

# 配置工作目录
# 为后续的RUN CMD ENTRYPOINT指定配置工作目录，可以使用多个WORKDIR指令，若后续指令用得是相对路径，则会基于之前的命令指定路径。
WORKDIR ${PHP_PATH}

# 声明镜像内服务监听的端口
# 格式为 EXPOSE port [port2,port3,...]，例如EXPOSE 80这条指令告诉Docker服务器暴露80端口，供容器外部连接使用
# 在启动容器的使用使用-P(大写)，P为自动映射，会将EXPOSE暴露出来的端口随机映射到宿主机的端口上，如果没有暴露端口，就不会有映射
# 使用-p(小写)可以具体指定使用哪个本地的端口来映射对外开放的端口，如：-p 80:80，-p [宿主机端口]：[容器端口]
EXPOSE 9000

# 指定容器运行时的用户名或UID，后续的RUN也会使用指定的用户。要临时使用管理员权限可以使用sudo。
USER www

# 容器启动时执行指令
CMD ["sbin/php-fpm","-c","etc/php-fpm.conf"]
