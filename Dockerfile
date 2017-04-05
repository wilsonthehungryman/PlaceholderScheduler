FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /PlaceholderScheduler
WORKDIR /PlaceholderScheduler
ADD Gemfile /PlaceholderScheduler/Gemfile
ADD Gemfile.lock /PlaceholderScheduler/Gemfile.lock
RUN bundle install
ADD . /PlaceholderScheduler

#FROM nginx

#RUN apt-get update

## RUBY
RUN apt-get install -y -q ruby ruby-dev rubygems irb build-essential libssl-dev zlib1g-dev

## RAILS
#RUN gem install rails --no-ri --no-rdoc
#RUN gem install bundler

#RUN apt-get install git

## RAILS APP
#ADD . /srv/PlaceholderScheduler
#RUN cd /srv/PlaceholderScheduler; bundle install
#EXPOSE 3000
