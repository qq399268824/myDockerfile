FROM centos:7.5.1804
MAINTAINER shaoyuny yaoshaoyao@gmail.com
WORKDIR /root
#RUN \
#	sed -i "/StrictHostKeyCheckin/d" /etc/ssh/ssh_config && \
#	sed -i "$aStrictHostKeyChecking no" /etc/ssh/ssh_config
RUN echo "* soft nproc 655350" > /etc/security/limits.d/20-nproc.conf
RUN echo "root soft nproc unlimited" >> /etc/security/limits.d/20-nproc.conf

RUN \
	echo "* soft nofile 655350" > /etc/security/limits.conf && \
	echo "* hard nofile 655350" >> /etc/security/limits.conf && \ 
	echo "* soft nproc 655350" >> /etc/security/limits.conf && \
	echo "* hard nproc 655350" >> /etc/security/limits.conf
#sed -i "/SELINUX/s/enforcing/disabled/" /etc/selinux/config && \
RUN \	
	echo "ulimit -n 655350" >> /etc/rc.local && \
	echo "ulimit -u 655350" >> /etc/rc.local
RUN \	
	rm -f /etc/sysctl.conf
COPY	sysctl.conf /etc/
RUN \	
	echo "echo never > /sys/kernel/mm/transparent_hugepage/enabled" >> /etc/rc.local && \
	useradd -m iotmp && \
	echo 123456 | passwd --stdin iotmp && \
	echo "$iotmpuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
#设置时区上海时间
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#安装必须的软件

RUN yum makecache && \
	yum install -y wget net-tools
CMD ["/usr/sbin"]
