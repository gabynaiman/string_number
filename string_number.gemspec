# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "string_number"
  spec.version       = '0.0.1'
  spec.authors       = ["Gabriel Naiman"]
  spec.email         = ["gabynaiman@gmail.com"]
  spec.description   = "Strings as a numbers"
  spec.summary       = "Strings as a numbers"
  spec.homepage      = "https://github.com/gabynaiman/string_number"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
end
