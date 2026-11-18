# frozen_string_literal: true

require_relative "test_helper"

class AnthropicGemspecTest < Minitest::Test
  def test_changelog_uri
    spec = Gem::Specification.load(File.expand_path("../../anthropic.gemspec", __dir__))

    refute_nil(spec)
    assert_equal(
      "https://github.com/anthropics/anthropic-sdk-ruby/blob/main/CHANGELOG.md",
      spec.metadata["changelog_uri"]
    )
  end
end
