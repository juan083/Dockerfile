# 创建基于centos7的nginx 1.16镜像

# 基础镜像
FROM centos:7

# 维护者信息
MAINTAINER juan083@163.com

# 指定环境变量
ENV TIME_ZOME Asia/Shanghai

RUN groupadd www && useradd -r -g www -s /bin/false www \
    && echo -e '[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/\ngpgcheck=0\nenabled=1' >> /etc/yum.repos.d/nginx.repo \
    && yum -y install nginx \
    && yum clean all \
    && yum -y remove gcc gcc-c++ make \
    && echo "${TIME_ZOME}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TIME_ZOME} /etc/localtime


# 声明镜像内服务监听的端口
# 格式为 EXPOSE port [port2,port3,...]，例如EXPOSE 80这条指令告诉Docker服务器暴露80端口，供容器外部连接使用
# 在启动容器的使用使用-P(大写)，P为自动映射，会将EXPOSE暴露出来的端口随机映射到宿主机的端口上，如果没有暴露端口，就不会有映射
# 使用-p(小写)可以具体指定使用哪个本地的端口来映射对外开放的端口，如：-p 80:80，-p [宿主机端口]：[容器端口]
EXPOSE 80 90 443 8080

COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

# 容器启动时执行指令
CMD ["./entrypoint.sh"]
