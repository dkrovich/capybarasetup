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
# $ docker run -p 0.0.0.0:3000:3000 -v /home/kro:/home/kro -i -t testdriven/rubyonrails
#
# From inside the container run: 
#
# $ bundle install --deployment && rails server -b 0.0.0.0
#
# Then point a web browser at http://127.0.0.1:3000
#
FROM ubuntu:14.04

EXPOSE 3000

WORKDIR /home/kro/rails/testdriven

RUN apt-get update && apt-get install -y ruby \
    ruby-dev \
    ruby-rails \
    sqlite3 \
    libsqlite3-dev \
    git \
    libmysqld-dev \
    emacs

CMD /bin/bash
