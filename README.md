# sinatra_new

## Description
A Ruby utility gem that creates a new Sinatra app, like 'rails new' does for Rails.

## Installation
Download the source code. An executable called 'sinatra_new' inside bin directory can be executed directly.

To build a gem, run the following command in the root directory of this application:

```console
gem build sinatra_new.gemspec
```

This will build a ruby gem for you, which you can install. To install this gem, execute:

```console
gem install sinatra_new-0.1.0.gem
```

This will install an executable called sinatra_new in your machine. You should be able to execute this executable from anywhere now.

## Usage
Once installed, you can use the program as follows:

```console
~> sinatra_new new_sinatra_app
      create
      create  app
      create  app/controllers
      create  app/controllers/application_controller.rb
      create  app/models
      create  app/views
      create  app/views/layout.erb
      create  app/views/index.erb
      create  config
      create  config/environment.rb
      create  db
      create  db/migrate
      create  config.ru
      create  CONTRIBUTING.md
      create  Gemfile
      create  Rakefile
      create  README.md
         run  git init inside new_sinatra_app
Initialized empty Git repository in /Users/anupkhadka/Code/new_sinatra_app/.git/

~/Code
~>
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
