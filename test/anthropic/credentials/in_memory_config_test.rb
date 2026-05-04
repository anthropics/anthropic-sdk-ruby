# frozen_string_literal: true

require_relative "../test_helper"
require "webmock"
require "tmpdir"
require "json"

class Anthropic::Credentials::InMemoryConfigTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def before_all
    super
    WebMock.enable!
  end

  def teardown
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def test_raises_without_authentication_block
    config = {"base_url" => "https://api.anthropic.com"}

    error = assert_raises(Anthropic::Errors::ConfigurationError) do
      Anthropic::Credentials::InMemoryConfig.new(config)
    end

    assert_match(/missing the 'authentication' object/, error.message)
  end

  def test_raises_with_unknown_auth_type
    config = {
      "authentication" => {"type" => "unknown"}
    }

    error = assert_raises(Anthropic::Errors::ConfigurationError) do
      Anthropic::Credentials::InMemoryConfig.new(config)
    end

    assert_match(/Unknown authentication.type/, error.message)
  end

  def test_raises_user_oauth_without_credentials_path
    config = {
      "authentication" => {"type" => "user_oauth"}
    }

    error = assert_raises(Anthropic::Errors::ConfigurationError) do
      Anthropic::Credentials::InMemoryConfig.new(config)
    end

    assert_match(/requires 'authentication.credentials_path'/, error.message)
  end

  def test_oidc_federation_requires_federation_rule_id
    config = {
      "organization_id" => "org-123",
      "authentication" => {
        "type" => "oidc_federation"
      }
    }

    imc = Anthropic::Credentials::InMemoryConfig.new(config)
    imc.bind_base_url("https://api.anthropic.com")

    error = assert_raises(Anthropic::Errors::ConfigurationError) do
      imc.call
    end

    assert_match(/federation_rule_id/, error.message)
  end

  def test_oidc_federation_requires_organization_id
    config = {
      "authentication" => {
        "type" => "oidc_federation",
        "federation_rule_id" => "rule-456"
      }
    }

    imc = Anthropic::Credentials::InMemoryConfig.new(config)
    imc.bind_base_url("https://api.anthropic.com")

    error = assert_raises(Anthropic::Errors::ConfigurationError) do
      imc.call
    end

    assert_match(/organization_id/, error.message)
  end

  def test_oidc_federation_with_custom_identity_token_provider
    token_provider = -> { "my-jwt-token" }
    config = {
      "organization_id" => "org-123",
      "authentication" => {
        "type" => "oidc_federation",
        "federation_rule_id" => "fdrl_01abc"
      }
    }

    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .with(
        body: hash_including(
          "grant_type" => "urn:ietf:params:oauth:grant-type:jwt-bearer",
          "assertion" => "my-jwt-token",
          "federation_rule_id" => "fdrl_01abc",
          "organization_id" => "org-123"
        )
      )
      .to_return(
        status: 200,
        body: JSON.generate({"access_token" => "access-token-123", "expires_in" => 3600}),
        headers: {"Content-Type" => "application/json"}
      )

    imc = Anthropic::Credentials::InMemoryConfig.new(config, identity_token_provider: token_provider)
    imc.bind_base_url("https://api.anthropic.com")

    token = imc.call

    assert_equal("access-token-123", token.token)
    refute_nil(token.expires_at)
  end

  def test_extra_headers_returns_workspace_id_for_non_federation
    config = {
      "workspace_id" => "ws-789",
      "authentication" => {
        "type" => "user_oauth",
        "credentials_path" => "/tmp/creds.json"
      }
    }

    imc = Anthropic::Credentials::InMemoryConfig.new(config)

    headers = imc.extra_headers

    assert_equal({"anthropic-workspace-id" => "ws-789"}, headers)
  end

  def test_extra_headers_omits_workspace_id_for_federation
    config = {
      "organization_id" => "org-123",
      "workspace_id" => "ws-789",
      "authentication" => {
        "type" => "oidc_federation",
        "federation_rule_id" => "rule-456"
      }
    }

    imc = Anthropic::Credentials::InMemoryConfig.new(config)

    headers = imc.extra_headers

    assert_equal({}, headers)
  end

  def test_user_oauth_reads_credentials_file
    Dir.mktmpdir do |tmpdir|
      creds_path = File.join(tmpdir, "creds.json")
      File.write(
        creds_path,
        JSON.generate(
          {
            "access_token" => "oauth-token-abc",
            "expires_at" => Time.now.to_i + 3600
          }
        )
      )
      File.chmod(0o600, creds_path)

      config = {
        "authentication" => {
          "type" => "user_oauth",
          "credentials_path" => creds_path
        }
      }

      imc = Anthropic::Credentials::InMemoryConfig.new(config)
      token = imc.call

      assert_equal("oauth-token-abc", token.token)
      refute_nil(token.expires_at)
    end
  end

  def test_resolved_base_url_returns_config_base_url
    config = {
      "base_url" => "https://custom.anthropic.com",
      "authentication" => {
        "type" => "oidc_federation",
        "federation_rule_id" => "rule-456"
      },
      "organization_id" => "org-123"
    }

    imc = Anthropic::Credentials::InMemoryConfig.new(config)

    assert_equal("https://custom.anthropic.com", imc.resolved_base_url)
  end

  def test_resolved_base_url_returns_nil_when_not_set
    config = {
      "authentication" => {
        "type" => "oidc_federation",
        "federation_rule_id" => "rule-456"
      },
      "organization_id" => "org-123"
    }

    imc = Anthropic::Credentials::InMemoryConfig.new(config)

    assert_nil(imc.resolved_base_url)
  end
end
