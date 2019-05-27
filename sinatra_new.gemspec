
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sinatra_new/version"

Gem::Specification.new do |spec|
  spec.name          = "sinatra_new"
  spec.version       = SinatraNew::VERSION
  spec.authors       = ["anupkhadka"]
  spec.email         = ["akhadka.dev@gmail.com"]

  spec.summary       = %q{A Ruby gem that comes with an executable to help create a new Sinatra app.}
  spec.homepage      = "https://github.com/anupkhadka/sinatra_new"
  spec.license       = "MIT"


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = "sinatra_new"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
