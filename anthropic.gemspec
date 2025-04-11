# frozen_string_literal: true

require_relative "lib/anthropic/version"

Gem::Specification.new do |s|
  s.name = "anthropic-sdk-beta"
  s.version = Anthropic::VERSION
  s.summary = "Ruby library to access the Anthropic API"
  s.authors = ["Anthropic"]
  s.email = "support@anthropic.com"
  s.files = Dir["lib/**/*.rb", "rbi/**/*.rbi", "sig/**/*.rbs", "manifest.yaml", "CHANGELOG.md", "SECURITY.md"]
  s.extra_rdoc_files = ["README.md"]
  s.required_ruby_version = ">= 3.0.0"
  s.add_dependency "connection_pool"
  s.homepage = "https://gemdocs.org/gems/anthropic-sdk-beta"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/anthropics/anthropic-sdk-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
end
