#nfs
FROM hyos:1.1
MAINTAINER shaoyuny yaoshaoyao@gmail.com
#安装nfs软件
RUN yum install nfs* rpcbind -y
#创建目录
RUN mkdir -p /data && chown iotmp:iotmp /data
VOLUME /data
WORKDIR /data
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 111/udp 2049/tcp
CMD ["/bin/bash"]
