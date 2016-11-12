# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smartphone_finder/version'
Gem::Specification.new do |spec|
  spec.name          = 'smartphone_finder'
  spec.authors       = ['Ali ALrawi']
  spec.email         = ['ali.developer90@gmail.com']
  spec.description   = 'Phones Specifications CLI App'
  spec.summary       = 'Phones Specifications CLI App'
  spec.homepage      = 'https://github.com/alrawi90/smartphone_finder'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($\)#['./lib/smartphone_finder']

  spec.executables   = ["smartphone_finder"]
  #spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = "smartphone_finder-cli-gem"
  spec.require_paths = ["lib", "lib/smartphone_finder"]
  spec.version       = SmartphoneFinder::VERSION

  # Dependencies
  spec.add_dependency 'nokogiri', '~> 1.6', '>= 1.6.8'

  # Dev Dependencies
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
