FROM nginx

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
