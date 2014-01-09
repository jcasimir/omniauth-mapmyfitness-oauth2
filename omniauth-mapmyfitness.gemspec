# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-mapmyfitness/version'

Gem::Specification.new do |spec|
  spec.name = "omniauth-mapmyfitness"

  spec.version       = OmniAuth::MapMyFitness::VERSION
  spec.authors       = ["Yeeland Chen", "Jeff Casimir"]
  spec.email         = ["yeeland.chen@mapmyfitness.com", "jeff@casimircreative.com"]
  spec.description   = "OmniAuth strategy for authenticating against MapMyFitness with OAuth 2"
  spec.summary       = "OmniAuth strategy for MapMyFitness OAuth2"
  spec.homepage      = "http://github.com/jcasimir/omniauth-mapmyfitness"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "json"
  spec.add_runtime_dependency "omniauth-oauth2"
end
