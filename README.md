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
