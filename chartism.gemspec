# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chartism/version'

Gem::Specification.new do |spec|
  spec.name          = "chartism"
  spec.version       = Chartism::VERSION
  spec.authors       = ["Tim Peters"]
  spec.email         = ["mail@darksecond.nl"]

  spec.summary       = %q{A ruby chart library based on chartist.js}
  spec.description   = %q{A library to create beautiful charts using a clean DSL and chartist.js}
  spec.homepage      = "http://github.com/darksecond/chartism"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
