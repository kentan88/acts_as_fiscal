$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_fiscal/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_fiscal"
  s.version     = ActsAsFiscal::VERSION
  s.authors     = ["Ken Tan"]
  s.email       = ["kentan0130@gmail.com"]
  s.homepage    = "https://github.com/kentan88/acts_as_fiscal"
  s.summary     = "Extends Date and Time class to provide fiscal date helper methods."
  s.description = "Extends Date and Time class to provide fiscal date helper methods."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"

  s.add_development_dependency "timecop"
  s.add_development_dependency "rspec-rails"
end
