# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano-fastly/version'

Gem::Specification.new do |gem|
  gem.name          = "capistrano-fastly"
  gem.version       = Capistrano::Fastly::VERSION
  gem.authors       = ["Dave Konopka"]
  gem.email         = ["dkonopka@articulate.com"]
  gem.description   = %q{Capistrano extensions for Fastly CDN service.}
  gem.summary       = %q{Execute Fastly api calls as part of your Capistrano deploys.}
  gem.homepage      = "https://github.com/articulate/capistrano-fastly"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano', '>= 2.0'
end
