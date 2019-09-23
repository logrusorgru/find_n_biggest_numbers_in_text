
lib = File.expand_path("lib", __dir__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "find_n_biggest_numbers_in_text/version"

Gem::Specification.new do |spec|
  spec.name          = "find_n_biggest_numbers_in_text"
  spec.version       = FindNBiggestNumbersInText::VERSION
  spec.authors       = ["Konstantin Ivanov"]
  spec.email         = ["kostyarin.ivanov@gmail.com"]

  spec.summary       = %q{Find a set of biggest numbers in a text}
  spec.description   = %q{Find a set of biggest decimal numbers in a text file}
  spec.homepage      = "https://github.com/logrusorgru/find_n_biggest_numbers_in_text"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] =
    "https://rubygems.org/gem/find_n_biggest_numbers_in_text"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] =
    "https://github.com/logrusorgru/find_n_biggest_numbers_in_text"
  spec.metadata["changelog_uri"] =
    "https://github.com/logrusorgru/find_n_biggest_numbers_in_text/tree/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
