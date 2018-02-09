# frozen_string_literal: true

require File.expand_path("../lib/github_data_provider/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name = "github_data_provider"
  spec.version = GithubDataProvider::VERSION
  spec.summary = "Data providers for Github"

  spec.required_ruby_version = ">= 2.4.0"
  spec.required_rubygems_version = ">= 2.5.0"

  spec.license = "MIT"

  spec.author = "Standout AB"
  spec.email = "info@standout.se"
  spec.homepage = "https://github.com/standout/github_data_provider"

  spec.files = `git ls-files -z`.split("\x0")
  spec.test_files = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
end
