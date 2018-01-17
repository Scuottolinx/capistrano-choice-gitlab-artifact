# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-choice-gitlab-artifact"
  gem.version       = '0.0.1'
  gem.authors       = ["Antonio Scuotto"]
  gem.email         = "scuottolinx@gmail.com"
  gem.summary       = %q{Capistrano Gitlab Choice Artifact - Deploy artifact from Gitlab build}
  gem.homepage      = "https://github.com/Scuottolinx/capistrano-choice-gitlab-artifact"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  gem.licenses      = ['MIT']

  gem.add_dependency 'capistrano', '~> 3.1'
  gem.add_dependency('rest-client', '>= 1.6.7')
  gem.add_dependency('json', '>= 1.7.7')
end