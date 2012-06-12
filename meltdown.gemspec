# -*- encoding: utf-8 -*-
require File.expand_path('../lib/meltdown/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Corey Innis"]
  gem.email         = ["corey@coolerator.net"]
  gem.description   = %q{A ruby alternative to pow/powder}
  gem.summary       = %q{A ruby alternative to pow/powder}
  gem.homepage      = "https://github.com/coreyti/meltdown"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "meltdown"
  gem.require_paths = ["lib"]
  gem.version       = Meltdown::VERSION

  gem.add_dependency 'rexec',   '~> 1.4.0'
  gem.add_dependency 'rubydns', '~> 0.4.0'
  gem.add_dependency 'thor',    '>= 0.11.5'
end
