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
    exchange_body = nil
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .with { |req| exchange_body = JSON.parse(req.body) }
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
    refute_includes(exchange_body, "service_account_id")
    refute_includes(exchange_body, "workspace_id")
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

  def test_includes_workspace_id_when_provided
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .with { |req| JSON.parse(req.body)["workspace_id"] == "wrkspc_01abc" }
      .to_return(
        status: 200,
        body: '{"access_token": "token", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: -> { "jwt" },
      federation_rule_id: "fdrl_01abc",
      organization_id: "org-123",
      workspace_id: "wrkspc_01abc"
    )

    result = provider.call
    assert_equal("token", result.token)
  end

  def test_includes_workspace_id_default_sentinel
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .with { |req| JSON.parse(req.body)["workspace_id"] == "default" }
      .to_return(
        status: 200,
        body: '{"access_token": "token", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: -> { "jwt" },
      federation_rule_id: "fdrl_01abc",
      organization_id: "org-123",
      workspace_id: "default"
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

  def test_401_without_workspace_id_includes_full_hint
    # Without a workspace_id, the hint includes all three parts: the federation
    # rule reminder, the workspace_id guidance, and the auth-events pointer.
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .to_return(
        status: 401,
        body: '{"error": "unauthorized"}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: -> { "jwt" },
      federation_rule_id: "fdrl_01abc",
      organization_id: "org-123"
    )

    error = assert_raises(Anthropic::Credentials::WorkloadIdentityError) { provider.call }
    assert_includes(error.message, "Ensure your federation rule matches your identity token")
    assert_includes(error.message, "ANTHROPIC_WORKSPACE_ID")
    assert_includes(error.message, "View your authentication events")
  end

  def test_401_with_workspace_id_set_omits_workspace_id_part
    # When workspace_id is already set the workspace_id guidance is noise, but the
    # rest of the hint (federation rule + auth events) is still useful.
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .to_return(
        status: 401,
        body: '{"error": "unauthorized"}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: -> { "jwt" },
      federation_rule_id: "fdrl_01abc",
      organization_id: "org-123",
      workspace_id: "wrkspc_x"
    )

    error = assert_raises(Anthropic::Credentials::WorkloadIdentityError) { provider.call }
    assert_includes(error.message, "Ensure your federation rule")
    assert_includes(error.message, "View your authentication events")
    refute_includes(error.message, "ANTHROPIC_WORKSPACE_ID")
  end

  def test_non_401_omits_hint
    # The hint is 401-specific; a 5xx or 400 shouldn't suggest a config change.
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .to_return(
        status: 500,
        body: '{"error": "server_error"}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: -> { "jwt" },
      federation_rule_id: "fdrl_01abc",
      organization_id: "org-123"
    )

    error = assert_raises(Anthropic::Credentials::WorkloadIdentityError) { provider.call }
    refute_includes(error.message, "Ensure your federation rule")
    refute_includes(error.message, "ANTHROPIC_WORKSPACE_ID")
    refute_includes(error.message, "View your authentication events")
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
