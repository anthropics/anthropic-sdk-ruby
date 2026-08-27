# frozen_string_literal: true

source "https://rubygems.org"

gemspec

# CI-only override to exercise the SDK against specific versions of its
# runtime dependencies (see .github/workflows/dependency-versions.yml).
%w[base64 cgi connection_pool standardwebhooks].each do |name|
  version = ENV.fetch("ANTHROPIC_TEST_#{name.upcase}_VERSION", nil)
  gem name, version if version
end

group :development do
  # transitive (via steep -> activesupport); floored for GHSA-h8w8-99g7-qmvj
  # and two sibling advisories fixed in 1.3.7
  gem "concurrent-ruby", ">= 1.3.7"
  gem "rake"
  gem "rbs"
  gem "rubocop"
  gem "sorbet"
  gem "steep"
  # syntax_tree >= 5 passes a third `options:` argument to formatter plugins,
  # which the newest released syntax_tree-rbs (1.0.0) does not accept.
  gem "syntax_tree", "< 5"
  gem "syntax_tree-rbs"
  gem "tapioca"
end

group :development, :test do
  gem "async"
  gem "minitest"
  gem "minitest-focus"
  gem "minitest-hooks"
  gem "minitest-proveit"
  gem "minitest-rg"
  gem "webmock"
end

group :development, :docs do
  gem "redcarpet"
  gem "webrick"
  # floored for GHSA-pxcc-8665-phx8 (static cache path traversal), fixed in 0.9.44
  gem "yard", ">= 0.9.44"
end

group :development, :test, :optional do
  gem "aws-sdk-bedrockruntime"
  gem "event_stream_parser"
  gem "faraday"
  gem "googleauth"
  gem "mcp"
end
