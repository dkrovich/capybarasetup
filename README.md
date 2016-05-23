# capybarasetup 

Sets up docker container of a proof of concept ruby on
rails application to show capybara and rspec in action.

## Setup

1. From the base directory build the docker container with the Dockerfile

 ```
 $ docker build -t testdriven/rubyonrails .
 ```

2. Run the container

 ```
 $ docker run -p 0.0.0.0:3000:3000 -i -t testdriven/rubyonrails
 ```

3. Execute tests

 ```
 $ coming soon
 ```

## Usage notes

* If you want to have data persist in the database, change this in
spec/rails_helper

```
config.use_transactional_fixtures = false
```

* To manually reset your database

```
$ RAILS_ENV=test rake db:reset
```


# old docs

Sets up a environment that can support capybara and rspec running on Ubuntu 14.04  in a Docker Container. 

Ever wanted to use Capybara with Rspec and had problems getting it working?  If so this guide might be of some help.

Basic Steps

1) Use provided Dockerfile to build a Docker Container.  See Instructions in comments of the Dockerfile for more information on how to accomplish that.  Launch docker container.

From INSIDE the docker container

2) rails new testdriven

3) Edit Gemfile and add:

gem 'capybara'
gem 'rspec'
gem 'rspec-rails'

gem 'therubyracer'

4) Run bundle install

5) rails generate rspec:install

6) mkdir spec/features

Put capybara tests there

7) Edit spec/spec_helper

at the top add:

require 'capybara/rspec'

Under "RSpec.configure do |config|" add:

  config.include Capybara::DSL

8) At this point rspec should run Capybara feature tests

At the top add:

require 'rails_helper'
require 'spec_helper'


