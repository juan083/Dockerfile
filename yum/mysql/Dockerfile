# 创建基于centos的MySQL8.0镜像

# 基础镜像
FROM centos:7

# 维护者信息
MAINTAINER juan083@163.com

ENV TIME_ZOME Asia/Shanghai

ARG MYSQL_SERVER_PACKAGE=mysql-community-server-minimal-8.0.19

# Install server
RUN groupadd mysql && useradd -r -g mysql -s /bin/false mysql \
  && yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm \
      https://repo.mysql.com/mysql-community-release-el7.rpm \
  && yum-config-manager --enable mysql80-server-minimal \
  && yum install -y \
      $MYSQL_SERVER_PACKAGE \
  && yum clean all \
  && mkdir -p /tmp/mysql \
  && chown -R mysql.mysql /tmp/mysql \
  && chmod -R 777 /tmp/mysql \
  && echo "${TIME_ZOME}" > /etc/timezone \
  && ln -sf /usr/share/zoneinfo/${TIME_ZOME} /etc/localtime

COPY entrypoint.sh ./entrypoint.sh
RUN chmod 777 ./entrypoint.sh

EXPOSE 3306 33060

CMD ["./entrypoint.sh"]
