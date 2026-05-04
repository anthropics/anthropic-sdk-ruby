# frozen_string_literal: true

require_relative "test_helper"
require "tmpdir"
require "json"
require "webmock"

class Anthropic::ClientCredentialsTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def setup
    @original_env = ENV.to_h
    @tmpdir = Dir.mktmpdir
    ENV["ANTHROPIC_CONFIG_DIR"] = @tmpdir
    FileUtils.mkdir_p(File.join(@tmpdir, "configs"))
    FileUtils.mkdir_p(File.join(@tmpdir, "credentials"))
    WebMock.enable!
  end

  def teardown
    FileUtils.rm_rf(@tmpdir)
    ENV["ANTHROPIC_API_KEY"] = nil
    ENV["ANTHROPIC_AUTH_TOKEN"] = nil
    ENV["ANTHROPIC_CONFIG_DIR"] = nil
    ENV.clear
    ENV.update(@original_env)
    WebMock.reset!
    WebMock.disable!
  end

  def test_credentials_provider_used_when_passed
    provider = Anthropic::Credentials::StaticToken.new("my-oauth-token")
    client = Anthropic::Client.new(credentials: provider)

    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .with(headers: {"Authorization" => "Bearer my-oauth-token"})
      .to_return(status: 200, body: '{"content": []}', headers: {"Content-Type" => "application/json"})

    refute_nil(client)
    refute_nil(client.token_cache)
  end

  def test_credentials_provider_sends_authorization_header
    provider = Anthropic::Credentials::StaticToken.new("my-oauth-token")
    client = Anthropic::Client.new(credentials: provider)

    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .to_return(status: 200, body: '{"content": []}', headers: {"Content-Type" => "application/json"})

    client.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello", role: :user}],
      model: :"claude-3-opus"
    )

    assert_requested(:post, "https://api.anthropic.com/v1/messages") do |req|
      assert_equal("Bearer my-oauth-token", req.headers["Authorization"])
    end
  end

  def test_default_credentials_used_when_no_explicit_auth
    ENV["ANTHROPIC_AUTH_TOKEN"] = "env-oauth-token"

    client = Anthropic::Client.new

    refute_nil(client)
    assert_equal("env-oauth-token", client.auth_token)
    assert_nil(client.token_cache)
  end

  def test_api_key_takes_precedence_over_credentials
    ENV["ANTHROPIC_API_KEY"] = "sk-ant-key"
    ENV["ANTHROPIC_AUTH_TOKEN"] = "oauth-token"

    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .with(headers: {"X-Api-Key" => "sk-ant-key"})
      .to_return(status: 200, body: '{"content": []}', headers: {"Content-Type" => "application/json"})

    client = Anthropic::Client.new
    refute_nil(client)
    assert_equal("sk-ant-key", client.api_key)
    assert_nil(client.token_cache)
  end

  def test_config_parameter_creates_in_memory_config
    config = {
      "organization_id" => "org-123",
      "authentication" => {
        "type" => "oidc_federation",
        "federation_rule_id" => "rule-456"
      }
    }

    client = Anthropic::Client.new(config: config)

    refute_nil(client)
    refute_nil(client.credentials)
    assert_instance_of(Anthropic::Credentials::InMemoryConfig, client.credentials)
  end

  def test_config_and_credentials_mutually_exclusive
    config = {
      "organization_id" => "org-123",
      "authentication" => {
        "type" => "oidc_federation",
        "federation_rule_id" => "rule-456"
      }
    }
    provider = Anthropic::Credentials::StaticToken.new("token")

    error = assert_raises(ArgumentError) do
      Anthropic::Client.new(config: config, credentials: provider)
    end

    assert_match(/at most one of.*credentials.*config/, error.message)
  end

  def test_config_with_base_url
    config = {
      "organization_id" => "org-123",
      "base_url" => "https://custom.anthropic.com",
      "authentication" => {
        "type" => "oidc_federation",
        "federation_rule_id" => "rule-456"
      }
    }

    client = Anthropic::Client.new(config: config)

    assert_equal("https://custom.anthropic.com", client.base_url.to_s)
  end

  def test_credentials_provider_sends_oauth_api_beta_header
    provider = Anthropic::Credentials::StaticToken.new("my-oauth-token")
    client = Anthropic::Client.new(credentials: provider)

    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .to_return(status: 200, body: '{"content": []}', headers: {"Content-Type" => "application/json"})

    client.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello", role: :user}],
      model: :"claude-3-opus"
    )

    assert_requested(:post, "https://api.anthropic.com/v1/messages") do |req|
      beta_header = req.headers["Anthropic-Beta"]
      assert_includes(beta_header.to_s, "oauth-2025-04-20")
    end
  end

  def test_401_invalidates_token_cache_and_retries_with_fresh_token
    Thread.current.thread_variable_set(:mock_sleep, [])
    tokens = %w[stale-token fresh-token]
    provider = ->(force_refresh: false) {
      _ = force_refresh
      Anthropic::Credentials::AccessToken.new(token: tokens.shift, expires_at: nil)
    }
    client = Anthropic::Client.new(credentials: provider, max_retries: 1)

    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .with(headers: {"Authorization" => "Bearer stale-token"})
      .to_return(status: 401, body: "{}", headers: {"Content-Type" => "application/json"})
    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .with(headers: {"Authorization" => "Bearer fresh-token"})
      .to_return(status: 200, body: '{"content": []}', headers: {"Content-Type" => "application/json"})

    client.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello", role: :user}],
      model: :"claude-3-opus"
    )

    assert_requested(
      :post,
      "https://api.anthropic.com/v1/messages",
      headers: {"Authorization" => "Bearer stale-token"},
      times: 1
    )
    assert_requested(
      :post,
      "https://api.anthropic.com/v1/messages",
      headers: {"Authorization" => "Bearer fresh-token"},
      times: 1
    )
    assert_empty(tokens)
  ensure
    Thread.current.thread_variable_set(:mock_sleep, nil)
  end

  def test_401_without_token_cache_does_not_retry
    Thread.current.thread_variable_set(:mock_sleep, [])
    client = Anthropic::Client.new(
      base_url: "http://localhost",
      api_key: "my-anthropic-api-key",
      max_retries: 2
    )

    stub_request(:post, "http://localhost/v1/messages")
      .to_return(status: 401, body: "{}", headers: {"Content-Type" => "application/json"})

    assert_raises(Anthropic::Errors::AuthenticationError) do
      client.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-3-opus"
      )
    end

    assert_requested(:post, "http://localhost/v1/messages", times: 1)
  ensure
    Thread.current.thread_variable_set(:mock_sleep, nil)
  end
end
