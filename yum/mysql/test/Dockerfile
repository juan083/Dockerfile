# 创建基于centos的MySQL8.0镜像

# 基础镜像
FROM centos:7

# 维护者信息
MAINTAINER juan083@163.com

ARG MYSQL_SERVER_PACKAGE=mysql-community-server-minimal-8.0.19
ARG MYSQL_SHELL_PACKAGE=mysql-shell-8.0.19

# Install server
RUN groupadd mysql && useradd -r -g mysql -s /bin/false mysql \
  && yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm \
      https://repo.mysql.com/mysql-community-release-el7.rpm \
  && yum-config-manager --enable mysql80-server-minimal \
  && yum install -y \
      $MYSQL_SERVER_PACKAGE \
      $MYSQL_SHELL_PACKAGE \
      libpwquality \
  && yum clean all

VOLUME /var/lib/mysql

USER mysql
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 3306 33060
CMD ["mysqld"]
