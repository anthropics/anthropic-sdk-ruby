# frozen_string_literal: true

require_relative "lib/anthropic/version"

Gem::Specification.new do |s|
  s.name = "anthropic"
  s.version = Anthropic::VERSION
  s.summary = "Ruby library to access the Anthropic API"
  s.authors = ["Anthropic"]
  s.email = "support@anthropic.com"
  s.files = Dir["lib/**/*.rb", "rbi/**/*.rbi", "sig/**/*.rbs", "manifest.yaml"]
  s.extra_rdoc_files = ["README.md"]
  s.required_ruby_version = ">= 3.0.0"
  s.add_dependency "connection_pool"
  s.homepage = "https://gemdocs.org/gems/anthropic/latest"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/stainless-sdks/anthropic-ruby"
  s.metadata["rubygems_mfa_required"] = "true"
end
