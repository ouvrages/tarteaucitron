# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tarteaucitron/version'

Gem::Specification.new do |spec|
  spec.name          = "tarteaucitron"
  spec.version       = Tarteaucitron::VERSION
  spec.authors       = ["Ouvrages"]
  spec.email         = ["contact@ouvrages-web.fr"]

  spec.summary       = %q{A gem to install tarteaucitron, GeoIP and provide helpers to show social network buttons.}
  spec.description   = %q{A gem to install tarteaucitron, GeoIP and provide helpers to show social network buttons. }
  spec.homepage      = "https://github.com/ouvrages/tarteaucitron"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_dependency "geoip"
  
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
