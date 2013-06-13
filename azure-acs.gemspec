# -*- encoding: utf-8 -*-
require File.expand_path('../lib/azure-acs/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'azure-acs'
  gem.version       = Azure::Acs::VERSION
  gem.description   = 'A lightweight Ruby client library for Azure Active Directory ACS.'
  gem.summary       = 'Azure Active Directory ACS Ruby client library.'

  gem.authors       = ['Keith Beckman']
  gem.email         = ['kbeckman.c4sc@gmail.com']
  gem.homepage      = 'https://github.com/kbeckman/azure-acs'

  gem.add_runtime_dependency 'typhoeus', '~> 0.4.2'

  gem.add_development_dependency 'rspec'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
