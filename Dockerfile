# Use phusion/passenger-full as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/passenger-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/passenger-customizable:0.9.20

CMD ["/sbin/my_init"]

# Set correct environment variables.
ENV HOME /root

RUN /pd_build/utilities.sh
RUN /pd_build/ruby-2.3.*.sh
RUN /pd_build/nodejs.sh

RUN rm -f /etc/service/nginx/down

RUN rm /etc/nginx/sites-enabled/default
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

WORKDIR /home/app/justref

ADD postgres-env.conf /etc/nginx/main.d/postgres-env.conf

ADD secret_key.conf /etc/nginx/main.d/secret_key.conf
ADD gzip_max.conf /etc/nginx/conf.d/gzip_max.conf

RUN apt-get install -y nodejs && ln -sf /usr/bin/nodejs /usr/local/bin/node

RUN gem install bundler
RUN gem install rails

COPY Gemfile* ./
RUN bundle install

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
