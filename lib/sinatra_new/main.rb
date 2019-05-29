class SinatraNew::Main

  def self.main(args)
    if !cmd_arg_is_valid?(args)
      exit(false)
    end
    app_name = args[0]
    SinatraNew::FileGenerator.generate_files(app_name)
    SinatraNew::ContentBuilder.build_content(app_name)

    puts "      run  git init from '.'"
    git_command = "git init #{app_name}"
    if !system(git_command)
      puts "'git init' failed."
    end

    puts "      run  bundle install"
    if !system('bundle install')
      puts "'bundle install' failed."
    end

  end

  private

  def self.cmd_arg_is_valid?(args)
    is_valid = false
    if args.length == 0
      usage("Missing app name")
    elsif args.length > 1
      usage("Too many arguments")
    else
      if File.exists?(args[0])
        puts "Please choose a different app name. A file(or directory) already exists with that name in this folder."
      else
        is_valid = true
      end
    end
    is_valid
  end

  def self.usage(error_msg)
    puts "#{error_msg}. Usage: sinatra_new <app_name>"
  end

end
