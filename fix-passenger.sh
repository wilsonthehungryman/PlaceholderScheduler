#!/bin/bash
echo empty gemset
rvm --force gemset empty
echo use 2.3.3
rvm --default use ruby-2.3.3
rvm list

echo reload nginx
service nginx reload

echo move to folder
cd /home/app/justref

echo $PWD and doing gem installs
gem install bundler
gem install rails
bundle install

rails db:setup RAILS_ENV=production
#rails db:create RAILS_ENV=prudction
echo migration
rails db:migrate RAILS_ENV=production

#echo seed
#rails db:seed RAILS_ENV=production

echo precompile
rails assets:precompile

echo copy assets
mkdir ./public/stylesheets ./public/javascript
cp ./public/assets/application-*.css ./public/stylesheets/application.css
cp ./public/assets/application-*.css.gz ./public/stylesheets/application.css.gz
cp ./public/assets/application-*.js ./public/stylesheets/application.js
cp ./public/assets/application-*.js.gz ./public/stylesheets/application.js.gz

cp ./public/assets/active_admin-*.css ./public/stylesheets/active_admin.css
cp ./public/assets/active_admin-*.css.gz ./public/stylesheets/active_admin.css.gz
cp ./public/assets/active_admin-*.js ./public/stylesheets/active_admin.js
cp ./public/assets/active_admin-*.js.gz ./public/stylesheets/active_admin.js.gz

/sbin/my_init
