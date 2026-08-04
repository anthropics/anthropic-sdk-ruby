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
  gem "rake"
  gem "rbs"
  gem "rubocop"
  gem "sorbet"
  gem "steep"
  gem "syntax_tree"
  gem "syntax_tree-rbs", github: "ruby-syntax-tree/syntax_tree-rbs", branch: "main"
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
  gem "yard"
end

group :development, :test, :optional do
  gem "aws-sdk-bedrockruntime"
  gem "event_stream_parser"
  gem "faraday"
  gem "googleauth"
  gem "mcp"
end
