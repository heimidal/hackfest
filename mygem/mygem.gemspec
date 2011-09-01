# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mygem/version"

Gem::Specification.new do |s|
  s.name        = "mygem"
  s.version     = Mygem::VERSION
  s.authors     = ["Hacker"]
  s.email       = ["hacker@quickleft.com"]
  s.homepage    = ""
  s.summary     = %q{This gem is awesome}
  s.description = %q{It makes things in to ASCII art.}

  s.rubyforge_project = "mygem"

  s.files = Dir["{lib}/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  # Development Dependencies
  s.add_development_dependency "bundler"  , "~> 1.0.0"
  s.add_development_dependency "rspec"
  s.add_development_dependency "jeweler"
  s.add_development_dependency "rake"
  s.add_dependency "httparty"
  s.add_dependency "googleajax"
end
