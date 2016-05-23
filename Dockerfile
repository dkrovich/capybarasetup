# Dockerfile to build a ruby on rails development environment
# with support for capybara and rspec.
# Uses Ubuntu 14.04 as a base.
#
# To build:
#
# $ docker build -t testdriven/rubyonrails .
#
# To run:
#
# $ docker run -p 0.0.0.0:3000:3000 -i -t testdriven/rubyonrails
#
# From inside the container run: 
#
# $ bundle install --deployment && rails server -b 0.0.0.0
#
# Then point a web browser at http://127.0.0.1:3000
#
FROM ubuntu:14.04

RUN mkdir /railsapps

WORKDIR /railsapps

RUN apt-get update && apt-get install -y ruby \
    ruby-dev \
    ruby-rails \
    sqlite3 \
    libsqlite3-dev \
    git \
    libmysqld-dev \
    emacs

RUN rails new testdriven

COPY ./Gemfile testdriven/

WORKDIR /railsapps/testdriven

RUN bundle install

RUN rails generate controller welcome index

COPY ./app/views/welcome/index.html.erb app/views/welcome/index.html.erb

COPY ./config/routes.rb config/routes.rb

RUN rails generate controller items

RUN rails generate rspec:install

RUN mkdir spec/features

COPY ./spec/spec_helper.rb spec/spec_helper.rb

COPY ./spec/rails_helper.rb spec/rails_helper.rb

CMD /bin/bash
