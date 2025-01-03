lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "applocale/version"

Gem::Specification.new do |spec|
  spec.name = "applocale-ruby"
  spec.version = AppLocale::VERSION
  spec.authors = ["Andrea Fomera"]
  spec.email = ["andrea@zerlex.net"]

  spec.summary = "Easily pull in your locales from AppLocale.dev"
  spec.description = "Easily pull in your locales from AppLocale.dev"
  spec.homepage = "https://applocale.dev"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/applocale/applocale-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/applocale/applocale-ruby/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.3.0"

  spec.add_dependency "httparty", "~> 0.18.0"
  spec.add_dependency "thor", ">= 0.18.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.4"
end
