# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll_reveal_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll_reveal_generator"
  spec.version       = JekyllRevealGenerator::VERSION
  spec.authors       = ["Tamara Temple"]
  spec.email         = ["tamouse@gmail.com"]

  spec.summary       = %q{Generate Jekyll-Reveal.js Slides}
  spec.description   = %q{Generate a slide presentation that uses Jekyll and Reveal.js}
  spec.homepage      = "https://github.com/tamouse/jekyll_reveal_generator"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler"
  spec.add_dependency "rake"
  spec.add_dependency "thor"
  spec.add_dependency "recursive-open-struct"

  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba", "~> 1.0.0-alpha.2"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "pry-byebug"

end
