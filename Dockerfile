FROM centos:centos7
MAINTAINER Seiji Toyama <seijit@me.com>

# repos
run rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
run yum -y upgrade

# Package
RUN yum -y install --enablerepo=centosplus\
   tar gcc gcc-c++ curl ntp sudo unzip wget passwd pcre-devel\
   openssl openssl-devel git nginx
RUN yum -y swap fakesystemd systemd
RUN yum -y clean all

# Ruby
RUN git clone https://github.com/sstephenson/ruby-build.git /tmp/ruby-build && \
  cd /tmp/ruby-build && \
  ./install.sh && \
  rm -rf /tmp/ruby-build

RUN ruby-build -v 2.1.3 /usr/local
RUN gem update --system
RUN gem install bundler --no-rdoc --no-ri

# # App
# RUN mkdir -p /app
# WORKDIR /app
# ADD .bundle/config /app/.bundle/config
# ADD Gemfile /app/Gemfile
# ADD Gemfile.lock /app/Gemfile.lock
# RUN bundle install
#
# # nginx
# ADD config/nginx/sites-enabled /app/config/nginx/sites-enabled
# RUN ln -s /app/config/nginx/sites-enabled/eventboard.in.conf /etc/nginx/conf.d/eventboard.in.conf
# RUN rm /etc/nginx/conf.d/default.conf
#
# # ntp
# RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
# RUN rm -f /etc/localtime
# RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
#
# # ADD docker/rails/start-server.sh /app/docker/rails/start-server.sh
# # RUN chmod +x /app/docker/rails/start-server.sh
# # ADD docker/rails/start-dev-server.sh /app/docker/rails/start-dev-server.sh
# # RUN chmod +x /app/docker/rails/start-dev-server.sh
# #
# # ADD docker/rails/setup_database.sh /app/docker/rails/setup_database.sh
# # RUN chmod +x /app/docker/rails/setup_database.sh
#
# RUN mkdir -p /var/log/rails
#
# EXPOSE 80
#
# CMD ["docker/rails/./start-dev-server.sh"]
