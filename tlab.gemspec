$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tlab/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tlab"
  s.version     = Tlab::VERSION
  s.authors     = ["Clarke Brunsdon"]
  s.email       = ["contact@freerunningtech.com"]
  s.homepage    = "http://github.com/freerunningtechnologies/tlab"
  s.summary     = "TLAB: Simple Mountable Blogging Engine"
  s.description = "Incredibly simple blog engine."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0.rc1"
  s.add_dependency "cancan"

  s.add_development_dependency "sqlite3"
end
