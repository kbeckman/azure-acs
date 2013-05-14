# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'azure-acs/version'

Gem::Specification.new do |gem|
  gem.name          = 'azure-acs'
  gem.version       = Azure::Acs::VERSION
  gem.authors       = ['kbeckman']
  gem.email         = ['kbeckman.c4sc@gmail.com']
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = 'https://github.com/kbeckman/azure-acs'

  gem.add_development_dependency 'rspec'

  gem.add_runtime_dependency 'typhoeus', '~> 0.5.4'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
