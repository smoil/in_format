$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "in_format/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "in_format"
  s.version     = InFormat::VERSION
  s.authors     = ["Cyrus Farajpour"]
  s.email       = ["smoils@gmail.com"]
  s.homepage    = "https://github.com/smoil/in_format"
  s.summary     = "Easily add custom getter and setter filters for attributes."
  s.description = "Easily add custom getter and setter filters for attributes."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE.txt", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "rails", "~> 3"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.8.1"
  s.add_development_dependency "attr_encrypted", "~> 1.2.0"
  s.add_development_dependency "wirble"
  s.add_development_dependency "awesome_print"
end
