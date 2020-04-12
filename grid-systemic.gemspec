require_relative 'lib/grid/systemic/version'

Gem::Specification.new do |spec|
  spec.name          = "grid-systemic"
  spec.version       = Grid::Systemic::VERSION
  spec.authors       = ["Gary Hepting"]
  spec.email         = ["ghepting@gmail.com"]

  spec.summary       = %q{The Sass-built, flexbox-based CSS grid and layout system}
  spec.description   = %q{The highly-configurable CSS grid system with flexibility beyond imagine. Supports both semantic and atomic utility-based CSS classes-in-markup styles of development.}
  spec.homepage      = "https://gitlab.com/stoneandtumble/grid-systemic"
  spec.license       = "MIT"

  # https://www.ruby-lang.org/en/downloads/branches/
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://gitlab.com/stoneandtumble/grid-systemic"
  spec.metadata["changelog_uri"] = "https://gitlab.com/stoneandtumble/grid-systemic/-/blob/master/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'sass'
  spec.add_dependency 'sass-rails', '~> 6.0.0'

  # for fractional classname generation
  spec.add_dependency 'activesupport'
  spec.add_dependency 'humanize'
  spec.add_dependency 'ordinalize'
end
