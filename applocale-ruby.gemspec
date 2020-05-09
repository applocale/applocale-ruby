lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "applocale/ruby/version"

Gem::Specification.new do |spec|
  spec.name          = "applocale-ruby"
  spec.version       = Applocale::Ruby::VERSION
  spec.authors       = ["Andrew Fomera"]
  spec.email         = ["andrew@zerlex.net"]

  spec.summary       = %q{Easily pull in your locales from AppLocale.dev}
  spec.description   = %q{Easily pull in your locales from AppLocale.dev}
  spec.homepage      = "https://applocale.dev"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/king601/applocale-ruby"#"TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "https://github.com/king601/applocale-ruby"#"TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.3.0"

  spec.add_dependency 'thor', '>= 0.20.0'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
