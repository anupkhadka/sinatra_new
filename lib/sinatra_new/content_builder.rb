class SinatraNew::ContentBuilder

  def self.build_content(app_name)
    build_app_controllers_files(app_name)
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

end
