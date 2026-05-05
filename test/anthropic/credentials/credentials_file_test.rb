# frozen_string_literal: true

require_relative "../test_helper"
require "tmpdir"
require "json"
require "webmock"

class Anthropic::Credentials::CredentialsFileTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def before_all
    super
    WebMock.enable!
  end

  def setup
    super
    @original_env = ENV.to_h
    @tmpdir = Dir.mktmpdir
    ENV["ANTHROPIC_CONFIG_DIR"] = @tmpdir
    FileUtils.mkdir_p(File.join(@tmpdir, "configs"))
    FileUtils.mkdir_p(File.join(@tmpdir, "credentials"))
  end

  def teardown
    ENV.clear
    ENV.update(@original_env)
    FileUtils.rm_rf(@tmpdir)
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def test_loads_oidc_federation_profile
    write_config(
      "test",
      {
        "organization_id" => "org-123",
        "workspace_id" => "wrkspc_x",
        "authentication" => {
          "type" => "oidc_federation",
          "federation_rule_id" => "fdrl_01abc",
          "identity_token" => {"source" => "file", "path" => token_file("jwt-content")}
        }
      }
    )

    exchange_body = nil
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .with { |req| exchange_body = JSON.parse(req.body) }
      .to_return(
        status: 200,
        body: '{"access_token": "exchanged", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::CredentialsFile.new("test")
    result = provider.call

    assert_equal("exchanged", result.token)
    assert_equal("wrkspc_x", exchange_body["workspace_id"])
    assert_equal({}, provider.extra_headers)
  end

  def test_env_vars_fill_missing_profile_fields
    write_config(
      "test",
      {
        "organization_id" => "org-123",
        "authentication" => {
          "type" => "oidc_federation",
          "federation_rule_id" => "fdrl_01abc"
        }
      }
    )
    ENV["ANTHROPIC_IDENTITY_TOKEN_FILE"] = token_file("jwt-from-env")

    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .to_return(
        status: 200,
        body: '{"access_token": "token", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::CredentialsFile.new("test")
    result = provider.call

    assert_equal("token", result.token)
    assert_requested(:post, "https://api.anthropic.com/v1/oauth/token", times: 1)
  end

  def test_profile_values_override_env_vars
    write_config(
      "test",
      {
        "organization_id" => "org-profile",
        "authentication" => {
          "type" => "oidc_federation",
          "federation_rule_id" => "fdrl_profile",
          "identity_token" => {"source" => "file", "path" => token_file("jwt-profile")}
        }
      }
    )
    ENV["ANTHROPIC_FEDERATION_RULE_ID"] = "fdrl_env"
    ENV["ANTHROPIC_ORGANIZATION_ID"] = "org-env"

    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .to_return(
        status: 200,
        body: '{"access_token": "token", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::CredentialsFile.new("test")
    result = provider.call

    assert_equal("token", result.token)
    assert_requested(:post, "https://api.anthropic.com/v1/oauth/token", times: 1)
  end

  def test_extra_headers_includes_workspace_id
    write_config(
      "test",
      {
        "workspace_id" => "wrkspc_01abc",
        "authentication" => {"type" => "user_oauth"}
      }
    )
    write_credentials("test", {"access_token" => "token", "expires_at" => Time.now.to_i + 3600})

    provider = Anthropic::Credentials::CredentialsFile.new("test")
    headers = provider.extra_headers

    assert_equal("wrkspc_01abc", headers["anthropic-workspace-id"])
  end

  def test_env_fills_missing_workspace_id
    write_config(
      "test",
      {
        "authentication" => {
          "type" => "oidc_federation",
          "federation_rule_id" => "fdrl_01abc"
        }
      }
    )
    ENV["ANTHROPIC_ORGANIZATION_ID"] = "org-env"
    ENV["ANTHROPIC_WORKSPACE_ID"] = "wrkspc_from_env"
    ENV["ANTHROPIC_IDENTITY_TOKEN_FILE"] = token_file("jwt")

    exchange_body = nil
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .with { |req| exchange_body = JSON.parse(req.body) }
      .to_return(
        status: 200,
        body: '{"access_token": "token", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::CredentialsFile.new("test")
    provider.call

    assert_equal("wrkspc_from_env", exchange_body["workspace_id"])
  end

  def test_env_workspace_id_fills_user_oauth
    # ANTHROPIC_WORKSPACE_ID fills workspace_id uniformly across profile types,
    # not just federation. For user_oauth the filled value surfaces as the
    # anthropic-workspace-id request header (federation routes it into the
    # exchange body instead).
    write_config(
      "test",
      {"authentication" => {"type" => "user_oauth"}}
    )
    write_credentials("test", {"access_token" => "token", "expires_at" => Time.now.to_i + 3600})
    ENV["ANTHROPIC_WORKSPACE_ID"] = "wrkspc_env"

    provider = Anthropic::Credentials::CredentialsFile.new("test")

    assert_equal({"anthropic-workspace-id" => "wrkspc_env"}, provider.extra_headers)
  end

  def test_profile_workspace_id_wins_over_env
    # ctor override > env var > profile is the global precedence model, but
    # within the config layer the profile value beats the env var fill.
    write_config(
      "test",
      {
        "organization_id" => "org-profile",
        "workspace_id" => "wrkspc_file",
        "authentication" => {
          "type" => "oidc_federation",
          "federation_rule_id" => "fdrl_01abc",
          "identity_token" => {"source" => "file", "path" => token_file("jwt")}
        }
      }
    )
    ENV["ANTHROPIC_WORKSPACE_ID"] = "wrkspc_env"

    exchange_body = nil
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .with { |req| exchange_body = JSON.parse(req.body) }
      .to_return(
        status: 200,
        body: '{"access_token": "token", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::CredentialsFile.new("test")
    provider.call

    assert_equal("wrkspc_file", exchange_body["workspace_id"])
  end

  def test_identity_token_from_env_source
    ENV["MY_JWT_TOKEN"] = "jwt-from-env-var"
    write_config(
      "test",
      {
        "organization_id" => "org-123",
        "authentication" => {
          "type" => "oidc_federation",
          "federation_rule_id" => "fdrl_01abc",
          "identity_token" => {"source" => "env", "value" => "MY_JWT_TOKEN"}
        }
      }
    )

    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .to_return(
        status: 200,
        body: '{"access_token": "exchanged-env-token", "expires_in": 3600}',
        headers: {"Content-Type" => "application/json"}
      )

    provider = Anthropic::Credentials::CredentialsFile.new("test")
    result = provider.call

    assert_equal("exchanged-env-token", result.token)
    assert_requested(:post, "https://api.anthropic.com/v1/oauth/token", times: 1)
  end

  def test_rejects_path_traversal_in_profile_name
    error = assert_raises(Anthropic::Errors::ConfigurationError) do
      Anthropic::Credentials::CredentialsFile.new("foo/../credentials/production")
    end
    assert_match(/path separator/, error.message)
  end

  def test_rejects_dot_leading_profile_name
    error = assert_raises(Anthropic::Errors::ConfigurationError) do
      Anthropic::Credentials::CredentialsFile.new(".hidden")
    end
    assert_match(/must not start with a dot/, error.message)
  end

  private

  def write_config(profile, data)
    File.write(File.join(@tmpdir, "configs", "#{profile}.json"), JSON.generate(data))
  end

  def write_credentials(profile, data)
    path = File.join(@tmpdir, "credentials", "#{profile}.json")
    File.write(path, JSON.generate(data))
    File.chmod(0o600, path)
  end

  def token_file(content)
    path = File.join(@tmpdir, "token_#{rand(10_000)}")
    File.write(path, content)
    path
  end
end
