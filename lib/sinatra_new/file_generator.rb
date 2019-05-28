require 'fileutils'
class SinatraNew::FileGenerator

    def self.generate_files(app_name)
      FileUtils.mkdir(app_name)
        # app
      FileUtils.mkdir("#{app_name}/app")
        # app/controllers
      FileUtils.mkdir("#{app_name}/app/controllers")
      FileUtils.touch("#{app_name}/app/controllers/application_controller.rb")

        # app/models
      FileUtils.mkdir("#{app_name}/app/models")

        # app/views
      FileUtils.mkdir("#{app_name}/app/views")
      FileUtils.touch("#{app_name}/app/views/layout.erb")
      FileUtils.touch("#{app_name}/app/views/index.erb")

        # config
      FileUtils.mkdir("#{app_name}/config")
      FileUtils.touch("#{app_name}/config/environment.rb")

        # db
      FileUtils.mkdir("#{app_name}/db")
      FileUtils.mkdir("#{app_name}/db/migrate")

        # config.ru
      FileUtils.touch("#{app_name}/config.ru")
        # CONTRIBUTING.md
      FileUtils.touch("#{app_name}/CONTRIBUTING.md")
        # Gemfile
      FileUtils.touch("#{app_name}/Gemfile")
        # Rakefile
      FileUtils.touch("#{app_name}/Rakefile")
        # README.md
      FileUtils.touch("#{app_name}/README.md")
    end

end
