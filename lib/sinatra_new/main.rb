class SinatraNew::Main

  def self.main(args)
    if !cmd_arg_is_valid?(args)
      exit(false)
    end
    app_name = args[0]
    puts "Creating a new app: #{app_name}"

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
