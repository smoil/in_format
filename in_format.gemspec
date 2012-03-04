$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "in_format/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "in_format"
  s.version     = InFormat::VERSION
  s.authors     = ["Cyrus Farajpour"]
  s.email       = ["cfarajpour@newleaders.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of InFormat."
  s.description = "TODO: Description of InFormat."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.8.1"
end
