FROM centos:centos6
MAINTAINER Seiji Toyama <seijit@me.com>

# Repos
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm

# Package
RUN yum -y install --enablerepo=centosplus\
  tar gcc gcc-c++ curl ntp sudo unzip wget passwd pcre-devel\
  openssl openssl-devel git nginx &&\
  yum -y clean all

# ntp
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# App
ADD _site /app/_site
ADD _config /app/_config
WORKDIR /app

# nginx
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/nginx.conf
RUN ln -s /app/_config/nginx/nginx.conf /etc/nginx/nginx.conf
RUN ln -s /app/_config/nginx/sites-enabled/blog.seiji.me.conf /etc/nginx/conf.d/blog.seiji.me.conf

EXPOSE 80

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
