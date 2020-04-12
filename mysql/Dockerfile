# 创建基于centos的MySQL镜像

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
ARG DOWNLOAD_URL="https://cdn.mysql.com/archives/mysql-5.7/mysql-5.7.28-linux-glibc2.12-x86_64.tar.gz"
ARG PREFIX_PATH="/usr/local/mysql"
ARG TMP_PATH="/tmp/mysql/"

# 镜像操作 开始...

# 添加内容到镜像，在当前路径添加tar.gz包
# ADD $PV.tar.gz /tmp

# 运行指定命令
RUN groupadd mysql && useradd -r -g www -s /bin/false mysql \
    && mkdir -p ${TMP_PATH} \
    && cd ${TMP_PATH} \
    && yum -y install gcc gcc-c++ make \
    && curl -O ${DOWNLOAD_URL} \
    && filename_list=(${DOWNLOAD_URL//\// }) \
    && tar_file=${filename_list[-1]} \
    && tar -zxvf ${tar_file} \
    && filename=(${tar_file//./ }) \
    && rm -rf ${tar_file} \
    && cd ./${filename}* \
    && ./configure  --prefix=${PREFIX_PATH} \
    --with-http_ssl_module --with-http_v2_module --with-http_realip_module \
    --with-http_geoip_module --with-http_geoip_module=dynamic \
    --with-http_gzip_static_module --without-http_gzip_module \
    --without-http_proxy_module --without-http_rewrite_module \
    --without-http_fastcgi_module --with-http_stub_status_module --with-pcre \
    && make \
    && make install \
    && echo "${TIME_ZOME}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TIME_ZOME} /etc/localtime \
    && rm -rf ${TMP_PATH} \
    && yum clean all \
    && yum -y remove gcc gcc-c++ make

# 镜像操作 结束...

# 配置工作目录
# 为后续的RUN CMD ENTRYPOINT指定配置工作目录，可以使用多个WORKDIR指令，若后续指令用得是相对路径，则会基于之前的命令指定路径。
WORKDIR ${PATH}

# 声明镜像内服务监听的端口
# 格式为 EXPOSE port [port2,port3,...]，例如EXPOSE 80这条指令告诉Docker服务器暴露80端口，供容器外部连接使用
# 在启动容器的使用使用-P(大写)，P为自动映射，会将EXPOSE暴露出来的端口随机映射到宿主机的端口上，如果没有暴露端口，就不会有映射
# 使用-p(小写)可以具体指定使用哪个本地的端口来映射对外开放的端口，如：-p 80:80，-p [宿主机端口]：[容器端口]
EXPOSE 80 443 8080 90

# 指定容器运行时的用户名或UID，后续的RUN也会使用指定的用户。要临时使用管理员权限可以使用sudo。
USER www

# 容器启动时执行指令
CMD ["sbin/nginx"]
