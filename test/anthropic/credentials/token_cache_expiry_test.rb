# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Credentials::TokenCacheExpiryTest < Minitest::Test
  {workload_identity: Anthropic::Credentials::WorkloadIdentityError, io: IOError}.each do |name, error_class|
    define_method("test_advisory_failure_before_expiry_returns_cached_token_#{name}") do
      assert_advisory_failure_at(59, error_class, expired: false)
    end

    define_method("test_advisory_failure_at_expiry_raises_original_error_#{name}") do
      assert_advisory_failure_at(60, error_class, expired: true)
    end

    define_method("test_advisory_failure_after_expiry_raises_original_error_#{name}") do
      assert_advisory_failure_at(61, error_class, expired: true)
    end
  end

  private

  def assert_advisory_failure_at(elapsed, error_class, expired:)
    current_time = 1000.0
    call_count = 0
    failure = error_class.new("refresh failed")
    provider = -> {
      call_count += 1
      if call_count == 2
        current_time += elapsed
        raise failure
      end
      Anthropic::Credentials::AccessToken.new(
        token: call_count == 1 ? "initial" : "recovered",
        expires_at: call_count == 1 ? 1600 : 2200
      )
    }
    cache = Anthropic::Credentials::TokenCache.new(provider, time_source: -> { current_time })

    assert_equal("initial", cache.get_token)
    current_time = 1540.0
    if expired
      assert_same(failure, assert_raises(error_class) { cache.get_token })
    else
      assert_equal("initial", cache.get_token)
    end
    assert_equal(2, call_count)
    assert_equal("recovered", cache.get_token)
    assert_equal(3, call_count)
  end
end
