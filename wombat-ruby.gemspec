# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wombat/client/version'

Gem::Specification.new do |spec|
  spec.name          = "wombat-ruby"
  spec.version       = Wombat::Client::VERSION
  spec.authors       = ["Peter Berkenbosch"]
  spec.email         = ["peter@spreecommerce.com"]
  spec.summary       = %q{ Ruby client for pushing data to Wombat }
  spec.description   = spec.summary
  spec.homepage      = "http://wombat.co"
  spec.license       = "New BSD"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0"
  spec.add_development_dependency "webmock"
  spec.add_dependency 'active_model_serializers', '~> 0.9.0'
  spec.add_dependency 'httparty'
end
