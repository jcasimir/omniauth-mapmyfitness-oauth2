# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-mapmyfitness-oauth2/version'

Gem::Specification.new do |spec|
  spec.name = "omniauth-mapmyfitness-oauth2"

  spec.version       = OmniAuth::MapMyFitness::VERSION
  spec.authors       = ["Jeff Casimir"]
  spec.email         = ["jeff@casimircreative.com"]
  spec.description   = "OmniAuth strategy for authenticating against MapMyFitness with OAuth 2"
  spec.summary       = "OmniAuth strategy for MapMyFitness OAuth2"
  spec.homepage      = "http://github.com/jcasimir/omniauth-mapmyfitness-oauth2"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "json"
  spec.add_runtime_dependency "omniauth-oauth2"
end
