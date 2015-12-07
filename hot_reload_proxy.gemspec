# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hot_reload_proxy/version'

Gem::Specification.new do |spec|
  spec.name          = 'hot_reload_proxy'
  spec.version       = HotReloadProxy::VERSION
  spec.authors       = ['Jacob Burenstam']
  spec.email         = ['burenstam@gmail.com']

  spec.summary       = %q{Stupid, simple proxy, for Webpack dev server hot-reload requests.}
  spec.description   = %q{Stupid simple proxy, for Webpack dev server hot-reload requests desired host and port.}
  spec.homepage      = 'https://github.com/buren/hot_reload_proxy'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rack-proxy'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
end
