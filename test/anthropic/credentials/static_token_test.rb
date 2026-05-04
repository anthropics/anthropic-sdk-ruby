# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Credentials::StaticTokenTest < Minitest::Test
  def test_call_returns_access_token
    provider = Anthropic::Credentials::StaticToken.new("sk-ant-123")
    result = provider.call
    assert_instance_of(Anthropic::Credentials::AccessToken, result)
    assert_equal("sk-ant-123", result.token)
    assert_nil(result.expires_at)
  end

  def test_force_refresh_is_ignored
    provider = Anthropic::Credentials::StaticToken.new("sk-ant-123")
    result = provider.call(force_refresh: true)
    assert_equal("sk-ant-123", result.token)
  end

  def test_returns_same_token_every_time
    provider = Anthropic::Credentials::StaticToken.new("sk-ant-123")
    assert_equal(provider.call.token, provider.call.token)
  end
end
