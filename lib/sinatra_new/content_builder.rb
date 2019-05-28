class SinatraNew::ContentBuilder

  def self.build_content(app_name)
    build_app_controllers_files(app_name)
    build_app_views_layout_file(app_name)
    build_app_views_index_file(app_name)
    build_config_environment_file(app_name)
    build_configru_file(app_name)
    build_gemfile(app_name)
  end

  private

  def self.build_app_controllers_files(app_name)
    File.open("#{app_name}/app/controllers/application_controller.rb", 'w') do |file|
      file.write(
        <<~HEREDOC
        require './config/environment'

        class ApplicationController < Sinatra::Base
          configure do
            set :public_folder, 'public'
            set :views, 'app/views'
          end

          get '/' do
            erb :index
          end

        end
        HEREDOC
      )
    end
  end

  def self.build_app_views_layout_file(app_name)
    title = app_name.split(/[_,-]/).map {|word| word.capitalize}.join
    File.open("#{app_name}/app/views/layout.erb", 'w') do |file|
      file.write(
        <<~HEREDOC
        <!DOCTYPE HTML>
        <html>
          <head>
            <title>#{title}</title>
          </head>
          <body>
            <%= yield %>
          </body>
        </html>
        HEREDOC
      )
    end
  end

  def self.build_app_views_index_file(app_name)
    title = app_name.split(/[_,-]/).map {|word| word.capitalize}.join
    File.open("#{app_name}/app/views/index.erb", 'w') do |file|
      file.write(
        <<~HEREDOC
          <h1>#{title}</h1>
          <h2>Landing page of your brand new sinatra app.</h2>
        HEREDOC
      )
    end
  end

  def self.build_config_environment_file(app_name)
    File.open("#{app_name}/app/config/environment.rb", 'w') do |file|
      file.write(
        <<~HEREDOC
        require 'bundler'
        require 'bundler/setup'
        Bundler.require(:default)

        ActiveRecord::Base.establish_connection(
          :adapter => "sqlite3",
          :database => "db/development.sqlite"
        )

        require_all 'app'
        HEREDOC
      )
    end
  end

  def self.build_configru_file(app_name)
    File.open("#{app_name}/config.ru", 'w') do |file|
      file.write(
        <<~HEREDOC
        require './config/environment'

        if ActiveRecord::Migrator.needs_migration?
          raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
        end

        run ApplicationController
        HEREDOC
      )
    end
  end

  def self.build_gemfile(app_name)
    File.open("#{app_name}/Gemfile", 'w') do |file|
      file.write(
        <<~HEREDOC
        source 'http://rubygems.org'

        gem 'sinatra'
        gem 'activerecord', '4.2.5', :require => 'active_record'
        gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
        gem 'rake'
        gem 'require_all'
        gem 'sqlite3', '~>1.3.6'
        gem 'thin'
        gem 'shotgun'
        gem 'pry'
        gem 'bcrypt'
        gem "tux"
        gem "rack-flash3"
        HEREDOC
      )
    end
  end



end
