# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clearsight/version'

Gem::Specification.new do |spec|
  spec.name          = "clearsight"
  spec.version       = Clearsight::VERSION
  spec.authors       = ["Jamon Holmgren"]
  spec.email         = ["jamon@clearsightstudio.com"]
  spec.description   = %q{Common utilities for ClearSight Studio}
  spec.summary       = %q{Common utilities for ClearSight Studio, a web and mobile app development studio in Portland, OR/Vancouver, WA.}
  spec.homepage      = "http://www.clearsightstudio.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency('rake', '~> 0.9.2')
  spec.add_dependency('methadone', '~> 1.3.0')
end
