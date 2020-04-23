# 创建基于centos的MySQL8.0镜像

# 基础镜像
FROM centos:7

# 维护者信息
MAINTAINER juan083@163.com

# 指定环境变量
ENV TIME_ZOME Asia/Shanghai

# 运行指定命令
RUN groupadd mysql && useradd -r -g mysql -s /bin/false mysql \
    && yum -y localinstall https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm \
    && yum -y install mysql-community-server \
    && yum clean all \
    && yum -y remove gcc gcc-c++ make \
    && echo "${TIME_ZOME}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TIME_ZOME} /etc/localtime

# 镜像操作 结束...

# 声明镜像内服务监听的端口
# 格式为 EXPOSE port [port2,port3,...]，例如EXPOSE 80这条指令告诉Docker服务器暴露80端口，供容器外部连接使用
# 在启动容器的使用使用-P(大写)，P为自动映射，会将EXPOSE暴露出来的端口随机映射到宿主机的端口上，如果没有暴露端口，就不会有映射
# 使用-p(小写)可以具体指定使用哪个本地的端口来映射对外开放的端口，如：-p 80:80，-p [宿主机端口]：[容器端口]
EXPOSE 3306

# 指定容器运行时的用户名或UID，后续的RUN也会使用指定的用户。要临时使用管理员权限可以使用sudo。
USER mysql
COPY docker-entrypoint.sh /entrypoint.sh

# 容器启动时执行指令
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]
