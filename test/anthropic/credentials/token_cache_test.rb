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

  class ControlledProvider
    attr_reader :started, :release, :forces

    def initialize(expires_at:)
      @started = Queue.new
      @release = Queue.new
      @forces = []
      @expires_at = expires_at
    end

    def call(force_refresh: false)
      @forces << force_refresh
      index = @forces.length
      @started << index
      @release.pop
      Anthropic::Credentials::AccessToken.new(token: "token-#{index}", expires_at: @expires_at)
    end
  end

  def join_cache_thread(thread)
    assert(thread.join(3), "token-cache caller did not finish")
    thread.value
  end

  def test_invalidation_during_fetch_preserves_the_next_forced_refresh
    [nil, Time.now.to_i + 3600].each do |expires_at|
      provider = ControlledProvider.new(expires_at: expires_at)
      cache = Anthropic::Credentials::TokenCache.new(provider)
      first = Thread.new { cache.get_token }
      assert_equal(1, provider.started.pop(timeout: 3))
      cache.invalidate
      provider.release << true
      assert_equal("token-1", join_cache_thread(first))

      provider.release << true
      assert_equal("token-2", cache.get_token)
      assert_equal([false, true], provider.forces)
      assert_equal("token-2", cache.get_token)
      assert_equal(2, provider.forces.length)
    ensure
      provider.release << true
      first&.join(3)
    end
  end

  def test_invalidation_during_a_forced_refresh_keeps_the_later_invalidation
    provider = ControlledProvider.new(expires_at: nil)
    cache = Anthropic::Credentials::TokenCache.new(provider)
    cache.invalidate
    first = Thread.new { cache.get_token }
    assert_equal(1, provider.started.pop(timeout: 3))
    cache.invalidate
    cache.invalidate
    provider.release << true
    assert_equal("token-1", join_cache_thread(first))
    provider.release << true
    assert_equal("token-2", cache.get_token)
    assert_equal([true, true], provider.forces)
  ensure
    provider.release << true
    first&.join(3)
  end

  def test_waiter_after_invalidation_fetches_a_new_token
    provider = ControlledProvider.new(expires_at: nil)
    cache = Anthropic::Credentials::TokenCache.new(provider)
    first = Thread.new { cache.get_token }
    assert_equal(1, provider.started.pop(timeout: 3))
    cache.invalidate
    waiting = Thread.new { cache.get_token }
    provider.release << true
    assert_equal("token-1", join_cache_thread(first))
    # The waiter must become the next leader instead of reusing the older result.
    assert_equal(2, provider.started.pop(timeout: 3))
    provider.release << true
    assert_equal("token-2", join_cache_thread(waiting))
    assert_equal([false, true], provider.forces)
  ensure
    2.times { provider.release << true }
    first&.join(3)
    waiting&.join(3)
  end

  def test_invalidation_during_advisory_refresh_forces_the_next_fetch
    provider = ControlledProvider.new(expires_at: 1090)
    cache = Anthropic::Credentials::TokenCache.new(provider, time_source: -> { 1000 })
    provider.release << true
    assert_equal("token-1", cache.get_token)
    assert_equal(1, provider.started.pop(timeout: 3))
    refresh = Thread.new { cache.get_token }
    assert_equal(2, provider.started.pop(timeout: 3))
    cache.invalidate
    provider.release << true
    assert_equal("token-2", join_cache_thread(refresh))
    provider.release << true
    assert_equal("token-3", cache.get_token)
    assert_equal([false, false, true], provider.forces)
  ensure
    provider.release << true
    refresh&.join(3)
  end

  def test_failed_refresh_after_invalidation_does_not_consume_force
    forces = []
    provider = lambda do |force_refresh: false|
      forces << force_refresh
      raise IOError, "first exchange failed" if forces.length == 1
      Anthropic::Credentials::AccessToken.new(token: "recovered", expires_at: nil)
    end
    cache = Anthropic::Credentials::TokenCache.new(provider)
    cache.invalidate
    assert_raises(IOError) { cache.get_token }
    assert_equal("recovered", cache.get_token)
    assert_equal([true, true], forces)
  end
end
