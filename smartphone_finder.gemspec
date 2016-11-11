# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = 'smartphone_finder'
  spec.version       = '1.0.0'
  spec.authors       = ['Ali ALrawi']
  spec.email         = ['ali.developer90@gmail.com']

  spec.summary       = 'Phones Specifications CLI App'
  spec.homepage      = 'https://github.com/alrawi90/smartphone_finder'
  spec.license       = 'MIT'

  spec.files         = ['./lib/smartphone_finder']

  # Dependencies
  spec.add_dependency 'nokogiri', '~> 1.6', '>= 1.6.8'

  # Dev Dependencies
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
