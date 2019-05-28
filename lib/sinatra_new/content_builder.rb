class SinatraNew::ContentBuilder

  def self.build_content(app_name)
    build_app_controllers_files(app_name)
    build_app_views_layout_file(app_name)
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

end
