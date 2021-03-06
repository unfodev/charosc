# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'charosc/version'

Gem::Specification.new do |gem|
  gem.name          = "charosc"
  gem.version       = Charosc::VERSION
  gem.authors       = ["Dan Richert"]
  gem.email         = ["dan.richert@gmail.com"]
  gem.description   = %q{Oscillating Markov text generator}
  gem.summary       = %q{Oscillating Markov text generator}
  gem.homepage      = ""

  gem.add_runtime_dependency "weighted_randomizer", "~> 0.1.2"
  gem.add_runtime_dependency "trollop", "~> 1.13"
  gem.add_runtime_dependency "ruby-progressbar", "~> 1.0.2"

  gem.add_development_dependency "rspec", "~> 2.12"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
