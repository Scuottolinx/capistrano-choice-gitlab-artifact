# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-choice-gitlab-artifact"
  gem.version       = '0.0.1'
  gem.authors       = ["Antonio Scuotto"]
  gem.summary       = %q{Capistrano Gitlab Choice Artifact - Deploy artifact from Gitlab build}
  gem.homepage      = "http://github.com/L0rD59/capistrano-gitlab-artifact"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  gem.licenses      = ['MIT']

  gem.add_dependency 'capistrano', '~> 3.1'
end