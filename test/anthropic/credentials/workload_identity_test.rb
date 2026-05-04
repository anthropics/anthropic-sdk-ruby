# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Credentials::WorkloadIdentityTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def before_all
    super
    WebMock.enable!
  end

  def setup
    super
    @original_env = ENV.to_h
  end

  def teardown
    ENV.clear
    ENV.update(@original_env)
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def test_exchanges_jwt_for_access_token
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .to_return(
        status: 200,
        body: '{"access_token": "ant-token", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: -> { "my-jwt" },
      federation_rule_id: "fdrl_01abc",
      organization_id: "org-123"
    )

    result = provider.call
    assert_equal("ant-token", result.token)
    assert_in_delta(Time.now.to_i + 3600, result.expires_at, 5)
  end

  def test_includes_service_account_id_when_provided
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .with { |req| JSON.parse(req.body)["service_account_id"] == "svac_01xyz" }
      .to_return(
        status: 200,
        body: '{"access_token": "token", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: -> { "jwt" },
      federation_rule_id: "fdrl_01abc",
      organization_id: "org-123",
      service_account_id: "svac_01xyz"
    )

    result = provider.call
    assert_equal("token", result.token)
  end

  def test_reinvokes_identity_token_provider_on_each_call
    call_count = 0
    identity_provider = -> {
      call_count += 1
      "jwt-#{call_count}"
    }

    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .to_return(
        status: 200,
        body: '{"access_token": "token", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: identity_provider,
      federation_rule_id: "fdrl_01abc",
      organization_id: "org-123"
    )

    provider.call
    provider.call

    assert_equal(2, call_count)
  end

  def test_raises_on_exchange_failure
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .to_return(
        status: 400,
        body: '{"error": "invalid_grant", "error_description": "Bad JWT"}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: -> { "bad-jwt" },
      federation_rule_id: "fdrl_01abc",
      organization_id: "org-123"
    )

    assert_raises(Anthropic::Credentials::WorkloadIdentityError) do
      provider.call
    end
  end

  def test_bind_base_url_changes_exchange_endpoint
    stub_request(:post, "https://staging.anthropic.com/v1/oauth/token")
      .to_return(
        status: 200,
        body: '{"access_token": "token", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: -> { "jwt" },
      federation_rule_id: "fdrl_01abc",
      organization_id: "org-123"
    )
    provider.bind_base_url("https://staging.anthropic.com")

    result = provider.call
    assert_equal("token", result.token)
  end
end
