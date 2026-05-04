# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Credentials::TokenCacheAdvisoryIOErrorTest < Minitest::Test
  def test_advisory_refresh_swallows_ioerror_and_returns_cached
    current_time = 1000.0
    call_count = 0

    provider = ->(force_refresh: false) { # rubocop:disable Lint/UnusedBlockArgument
      call_count += 1
      raise IOError, "connection reset" unless call_count == 1
      Anthropic::Credentials::AccessToken.new(token: "initial", expires_at: 1100)
    }

    cache = Anthropic::Credentials::TokenCache.new(
      provider,
      advisory_refresh_seconds: 120,
      mandatory_refresh_seconds: 30,
      time_source: -> { current_time }
    )

    assert_equal("initial", cache.get_token)
    assert_equal(1, call_count)

    current_time = 1050.0

    token = cache.get_token
    assert_equal("initial", token)
    assert_equal(2, call_count)
  end

  def test_mandatory_refresh_raises_ioerror
    current_time = 1000.0
    call_count = 0

    provider = ->(force_refresh: false) { # rubocop:disable Lint/UnusedBlockArgument
      call_count += 1
      raise IOError, "connection reset" unless call_count == 1
      Anthropic::Credentials::AccessToken.new(token: "initial", expires_at: 1020)
    }

    cache = Anthropic::Credentials::TokenCache.new(
      provider,
      advisory_refresh_seconds: 120,
      mandatory_refresh_seconds: 30,
      time_source: -> { current_time }
    )

    assert_equal("initial", cache.get_token)

    current_time = 1000.0

    assert_raises(IOError) do
      cache.get_token
    end
  end
end
