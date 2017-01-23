# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emarsys/delivery_method/version'

Gem::Specification.new do |spec|
  spec.name          = 'emarsys-delivery_method'
  spec.version       = Emarsys::DeliveryMethod::VERSION
  spec.authors       = ['Istvan Demeter']
  spec.email         = ['demeter.istvan@gmail.com']

  spec.summary       = 'Deliver method to be used with the great Mail gem (so ActionMailer and Rails as well)'
  spec.homepage      = 'https://github.com/emartech/emarsys-delivery_method'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'emarsys-api', '~> 0.3'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'mail', '~> 2.6'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 0.46'
end
