# capybarasetup 

Sets up docker container of a proof of concept ruby on rails
application to show capybara and rspec in action.  In particular this
focuses on an example feature test that attempts to simulate an
external user browing and using an application.  All other default
tests that are generated are deleted via RUN commands in the
Dockerfile.

To really bring the concept of test driven development home, the
application is not fully developed.  Running rspec will generate
failures.  The challenge is to fill in the code to make the error go
away.  Aka, test driven development.


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

 From the rails application base directory run

 ```
 $ rspec
 ```


## Usage notes

* To run the reference application, just fire up WebRick from the
  application base directory.

```
$ rails s
```

* If you want to have data persist in the database instead of being
  reset after rspec runs, change this setting in
  spec/rails_helper.rb

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


