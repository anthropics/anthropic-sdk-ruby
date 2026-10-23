# frozen_string_literal: true

require "json"
require "open3"

require_relative "../test_helper"

class Anthropic::Test::ExternalMixinTest < Minitest::Test
  def test_flags_a_mixin_called_on_a_constant
    assert_equal([1, 2, 3], offending_lines(<<~RUBY))
      Client.prepend(Extra)
      Internal::Client.include(Extra)
      ::Client.extend(Extra)
    RUBY
  end

  def test_allows_a_mixin_called_elsewhere
    assert_empty(offending_lines(<<~RUBY))
      class Client
        include Extra
      end

      client.extend(Extra)
    RUBY
  end

  private

  def offending_lines(source)
    rubocop = %w[rubocop --require ./lint/cop/external_mixin --only Custom/ExternalMixin --format json]
    report, = Open3.capture2(*rubocop, "--stdin", "example.rb", stdin_data: source)
    JSON.parse(report, symbolize_names: true) => {files: [{offenses:}]}
    offenses.map { _1.dig(:location, :line) }
  end
end
