# Use phusion/passenger-full as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/passenger-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/passenger-full:latest

# Set correct environment variables.
ENV HOME /root
ENV PLACEHOLDERSCHEDULER_DATABASE_PASSWORD password

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

RUN rm -f /etc/service/nginx/down
# Dockerfile:
RUN rm /etc/nginx/sites-enabled/default
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf
RUN mkdir /home/app/webapp
#RUN ...commands to place your web app in /home/app/webapp...
# ...put your own build instructions here...
#RUN mkdir home/app/
#RUN mkdir home/app/placeholder


# /etc/nginx/main.d/postgres-env.conf:
#env POSTGRES_PORT_5432_TCP_ADDR;
#env POSTGRES_PORT_5432_TCP_PORT;

# Dockerfile:
ADD postgres-env.conf /etc/nginx/main.d/postgres-env.conf

# /etc/nginx/main.d/secret_key.conf:
#env SECRET_KEY=123456;

# /etc/nginx/conf.d/gzip_max.conf:
#gzip_comp_level 9;

# Dockerfile:
ADD secret_key.conf /etc/nginx/main.d/secret_key.conf
ADD gzip_max.conf /etc/nginx/conf.d/gzip_max.conf

COPY . home/app/webapp/placeholder
RUN cd home/app/webapp/placeholder;bundle install

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
