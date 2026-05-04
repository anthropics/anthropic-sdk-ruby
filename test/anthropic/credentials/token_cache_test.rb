# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Credentials::TokenCacheTest < Minitest::Test
  def test_caches_token_from_provider
    call_count = 0
    provider = ->(_force_refresh: false) {
      call_count += 1
      Anthropic::Credentials::AccessToken.new(token: "cached-token", expires_at: Time.now.to_i + 3600)
    }

    cache = Anthropic::Credentials::TokenCache.new(provider)

    assert_equal("cached-token", cache.get_token)
    assert_equal("cached-token", cache.get_token)
    assert_equal(1, call_count)
  end

  def test_returns_cached_token_without_expiry_forever
    provider = ->(_force_refresh: false) {
      Anthropic::Credentials::AccessToken.new(token: "static", expires_at: nil)
    }

    cache = Anthropic::Credentials::TokenCache.new(provider)

    assert_equal("static", cache.get_token)
    assert_equal("static", cache.get_token)
  end

  def test_refreshes_in_mandatory_window
    current_time = Time.now.to_i
    call_count = 0
    provider = ->(_force_refresh: false) {
      call_count += 1
      expires = call_count == 1 ? current_time + 10 : current_time + 3600
      Anthropic::Credentials::AccessToken.new(token: "token-#{call_count}", expires_at: expires)
    }

    cache = Anthropic::Credentials::TokenCache.new(
      provider,
      mandatory_refresh_seconds: 30,
      time_source: -> { current_time }
    )

    assert_equal("token-1", cache.get_token)
    assert_equal("token-2", cache.get_token)
    assert_equal(2, call_count)
  end

  def test_invalidate_clears_cache
    call_count = 0
    provider = ->(_force_refresh: false) {
      call_count += 1
      Anthropic::Credentials::AccessToken.new(token: "token-#{call_count}", expires_at: Time.now.to_i + 3600)
    }

    cache = Anthropic::Credentials::TokenCache.new(provider)

    assert_equal("token-1", cache.get_token)
    cache.invalidate
    assert_equal("token-2", cache.get_token)
    assert_equal(2, call_count)
  end

  def test_invalidate_sets_force_refresh
    force_values = []
    provider = ->(force_refresh: false) {
      force_values << force_refresh
      Anthropic::Credentials::AccessToken.new(token: "token", expires_at: Time.now.to_i + 3600)
    }

    cache = Anthropic::Credentials::TokenCache.new(provider)

    cache.get_token
    cache.invalidate
    cache.get_token

    assert_equal([false, true], force_values)
  end

  def test_concurrent_initial_fetch_calls_provider_once
    call_count = 0
    call_count_lock = Mutex.new
    provider = ->(_force_refresh: false) {
      sleep(0.01)
      call_count_lock.synchronize { call_count += 1 }
      Anthropic::Credentials::AccessToken.new(token: "concurrent-token", expires_at: Time.now.to_i + 3600)
    }

    cache = Anthropic::Credentials::TokenCache.new(provider)

    threads = 5.times.map do
      Thread.new { cache.get_token }
    end

    results = threads.map(&:value)

    assert_equal(1, call_count)
    assert_equal(["concurrent-token"] * 5, results)
  end

  def test_propagates_argument_error_from_provider_bug
    first_call = true
    provider = ->(force_refresh: false) { # rubocop:disable Lint/UnusedBlockArgument
      if first_call
        first_call = false
        raise ArgumentError, "invalid value for Integer(): 'bad'"
      end
      Anthropic::Credentials::AccessToken.new(token: "masked-bug-token", expires_at: Time.now.to_i + 3600)
    }

    cache = Anthropic::Credentials::TokenCache.new(provider)

    error = assert_raises(ArgumentError) do
      cache.get_token
    end
    assert_match(/invalid value/, error.message)
  end

  def test_falls_back_for_provider_without_force_refresh_kwarg
    call_count = 0
    provider = lambda {
      call_count += 1
      Anthropic::Credentials::AccessToken.new(token: "no-kwarg-token", expires_at: Time.now.to_i + 3600)
    }

    cache = Anthropic::Credentials::TokenCache.new(provider)

    assert_equal("no-kwarg-token", cache.get_token)
    assert_equal(1, call_count)
  end
end
