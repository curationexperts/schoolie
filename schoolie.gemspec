# frozen_string_literal: true

require_relative "lib/schoolie/version"

Gem::Specification.new do |spec|
  spec.name = "schoolie"
  spec.version = Schoolie::VERSION
  spec.authors = ["McClain Looney"]
  spec.email = ["mcclain@curationexperts.com"]

  spec.summary = "A gem to generate sitemaps & meta tags for Samvera repositories"
  spec.homepage = "https://github.com/curationexperts/schoolie"
  spec.license = "Apache-2.0"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/curationexperts/schoolie"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == File.basename(__FILE__)) ||
        f == "#{spec.name}-#{Schoolie::VERSION}.gem" ||
        f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rails", "~> 5"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.add_development_dependency "byebug", "~> 1.25"
  spec.add_development_dependency "minitest", "~> 5.15"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "~> 1.25"
  spec.metadata["rubygems_mfa_required"] = "true"
end
