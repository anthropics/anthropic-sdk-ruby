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
    %w[ANTHROPIC_BASE_URL ANTHROPIC_API_KEY ANTHROPIC_AUTH_TOKEN].each { ENV.delete(_1) }
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
    assert_nil(client.auth_token)
    assert_nil(client.token_cache)
  end

  def test_credential_precedence
    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .to_return(status: 200, body: '{"content": []}', headers: {"Content-Type" => "application/json"})

    write_user_oauth_profile(base_url: "https://profile.example.com")

    both_env = {"ANTHROPIC_API_KEY" => "env-key", "ANTHROPIC_AUTH_TOKEN" => "env-token"}
    provider = Anthropic::Credentials::StaticToken.new("provider-token")
    cases = {
      "a passed key" => [{}, {api_key: "passed-key"}, "passed-key"],
      "the env key" => [{"ANTHROPIC_API_KEY" => "env-key"}, {}, "env-key"],
      "the env key beats the env token" => [both_env, {}, "env-key"],
      "an empty env key is unset" => [{**both_env, "ANTHROPIC_API_KEY" => ""}, {}, "env-token"],
      "a passed token beats the env key" => [both_env, {auth_token: "passed-token"}, "passed-token"],
      "a passed key beats the env token" => [both_env, {api_key: "passed-key"}, "passed-key"],
      "a passed provider beats the env" => [both_env, {credentials: provider}, "provider-token"],
      "a passed config beats the env" => [both_env, {config: user_oauth_config}, "oauth-token"]
    }

    cases.each do |name, (env, args, sent)|
      WebMock.reset_executed_requests!
      %w[ANTHROPIC_API_KEY ANTHROPIC_AUTH_TOKEN].each { ENV.delete(_1) }
      ENV.update(env)

      Anthropic::Client.new(**args).messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-3-opus"
      )

      assert_requested(:post, "https://api.anthropic.com/v1/messages") do |req|
        assert_equal("Bearer #{sent}", req.headers["Authorization"], name)
        assert_nil(req.headers["X-Api-Key"], name)
      end
    end
  end

  def test_empty_api_key_sends_no_credential
    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .to_return(status: 200, body: '{"content": []}', headers: {"Content-Type" => "application/json"})

    Anthropic::Client.new(api_key: "").messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello", role: :user}],
      model: :"claude-3-opus"
    )

    assert_requested(:post, "https://api.anthropic.com/v1/messages") do |req|
      assert_nil(req.headers["Authorization"])
    end
  end

  def test_env_credential_order
    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .to_return(status: 200, body: '{"content": []}', headers: {"Content-Type" => "application/json"})
    stub_request(:post, "https://api.anthropic.com/v1/oauth/token")
      .to_return_json(status: 200, body: {access_token: "federated-token", expires_in: 3600})
    write_user_oauth_profile(token: "active-profile-token")
    write_user_oauth_profile(name: "named", token: "named-profile-token")

    order = [
      [{"ANTHROPIC_API_KEY" => "env-key"}, "env-key"],
      [{"ANTHROPIC_AUTH_TOKEN" => "env-token"}, "env-token"],
      [{"ANTHROPIC_PROFILE" => "named"}, "named-profile-token"],
      [
        {
          "ANTHROPIC_IDENTITY_TOKEN" => "jwt",
          "ANTHROPIC_FEDERATION_RULE_ID" => "fdrl_01abc",
          "ANTHROPIC_ORGANIZATION_ID" => "org-123"
        },
        "federated-token"
      ],
      [{}, "active-profile-token"]
    ]
    ENV.update(*order.map(&:first))

    order.each do |env, sent|
      WebMock.reset_executed_requests!

      Anthropic::Client.new.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-3-opus"
      )

      assert_requested(:post, "https://api.anthropic.com/v1/messages") do |req|
        assert_equal("Bearer #{sent}", req.headers["Authorization"])
      end
      env.each_key { ENV.delete(_1) }
    end
  end

  def test_passed_credential_does_not_warn_about_the_env
    ENV["ANTHROPIC_API_KEY"] = "env-key"

    with_warning_not_yet_given(:@warned_env_shadow) do
      _out, err = capture_io { Anthropic::Client.new(api_key: "passed-key") }
      refute_match(/ANTHROPIC_API_KEY/, err)

      _out, err = capture_io { Anthropic::Client.new }
      assert_match(/ANTHROPIC_API_KEY is set and takes precedence/, err)
    end
  end

  def test_env_key_and_env_token_warn_once
    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .to_return(status: 200, body: '{"content": []}', headers: {"Content-Type" => "application/json"})
    ENV.update("ANTHROPIC_API_KEY" => "env-key", "ANTHROPIC_AUTH_TOKEN" => "env-token")

    with_warning_not_yet_given(:@warned_env_api_key_and_auth_token) do
      _out, err = capture_io do
        Anthropic::Client.new.messages.create(
          max_tokens: 1024,
          messages: [{content: "Hello", role: :user}],
          model: :"claude-3-opus"
        )
      end

      assert_equal(
        1,
        err.lines.count(
          "Anthropic: ANTHROPIC_API_KEY and ANTHROPIC_AUTH_TOKEN are both set. Using ANTHROPIC_API_KEY.\n"
        )
      )
      assert_requested(:post, "https://api.anthropic.com/v1/messages") do |req|
        assert_equal("Bearer env-key", req.headers["Authorization"])
      end

      _out, err = capture_io { Anthropic::Client.new }
      refute_match(/are both set/, err)
    end
  end

  def test_env_key_and_env_token_warning_needs_both_and_no_passed_credential
    both_env = {"ANTHROPIC_API_KEY" => "env-key", "ANTHROPIC_AUTH_TOKEN" => "env-token"}
    cases = {
      "only the env key" => [both_env.slice("ANTHROPIC_API_KEY"), {}],
      "only the env token" => [both_env.slice("ANTHROPIC_AUTH_TOKEN"), {}],
      "an empty env key" => [{**both_env, "ANTHROPIC_API_KEY" => ""}, {}],
      "an empty env token" => [{**both_env, "ANTHROPIC_AUTH_TOKEN" => ""}, {}],
      "a passed key" => [both_env, {api_key: "passed-key"}],
      "a passed token" => [both_env, {auth_token: "passed-token"}],
      "a passed provider" => [both_env, {credentials: Anthropic::Credentials::StaticToken.new("provider-token")}],
      "a passed config" => [both_env, {config: user_oauth_config}]
    }

    with_warning_not_yet_given(:@warned_env_api_key_and_auth_token) do
      cases.each do |name, (env, args)|
        both_env.each_key { ENV.delete(_1) }
        ENV.update(env)

        _out, err = capture_io { Anthropic::Client.new(**args) }

        refute_match(/are both set/, err, name)
      end
    end
  end

  def test_platform_client_does_not_warn_about_env_key_and_env_token
    ENV.update("ANTHROPIC_API_KEY" => "env-key", "ANTHROPIC_AUTH_TOKEN" => "env-token")

    with_warning_not_yet_given(:@warned_env_api_key_and_auth_token) do
      _out, err = capture_io { Anthropic::AWSClient.new(skip_auth: true, base_url: "http://localhost") }
      refute_match(/are both set/, err)
    end
  end

  def test_api_key_header_set_by_hand
    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .to_return(status: 307, headers: {"location" => "https://example.com/redirected"})
    stub_request(:post, "https://example.com/redirected")
      .to_return(status: 200, body: '{"content": []}', headers: {"Content-Type" => "application/json"})

    send_x_api_key = lambda do |req, nxt|
      next nxt.call(req) unless req.headers["authorization"] == "Bearer sk-ant-key"
      nxt.call(req.with(headers: {**req.headers.except("authorization"), "x-api-key" => "sk-ant-key"}))
    end

    Anthropic::Client.new(api_key: "sk-ant-key", middleware: send_x_api_key).messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello", role: :user}],
      model: :"claude-3-opus"
    )

    assert_requested(:post, "https://api.anthropic.com/v1/messages") do |req|
      assert_equal("sk-ant-key", req.headers["X-Api-Key"])
      assert_nil(req.headers["Authorization"])
    end
    assert_requested(:post, "https://example.com/redirected") do |req|
      assert_nil(req.headers["X-Api-Key"])
      assert_nil(req.headers["Authorization"])
    end
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

  def test_credential_options_mutually_exclusive
    options = {
      api_key: "passed-key",
      auth_token: "passed-token",
      credentials: Anthropic::Credentials::StaticToken.new("provider-token"),
      config: user_oauth_config
    }

    options.keys.combination(2) do |pair|
      error = assert_raises(ArgumentError) { Anthropic::Client.new(**options.slice(*pair)) }

      assert_equal(
        "Pass at most one of `api_key:`, `auth_token:`, `credentials:`, or `config:`. " \
        "Received `#{pair.first}:`, `#{pair.last}:`.",
        error.message
      )
    end

    client = Anthropic::Client.new(**options.transform_values { nil }, auth_token: "passed-token")
    assert_equal("passed-token", client.auth_token)
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

  def test_profile_base_url_used_when_no_explicit_or_env_base_url
    write_user_oauth_profile(base_url: "https://profile.example.com")

    client = Anthropic::Client.new

    assert_equal("https://profile.example.com", client.base_url.to_s)
  end

  def test_env_base_url_takes_precedence_over_profile_base_url
    write_user_oauth_profile(base_url: "https://profile.example.com")
    ENV["ANTHROPIC_BASE_URL"] = "https://env.example.com"

    client = Anthropic::Client.new

    assert_equal("https://env.example.com", client.base_url.to_s)
    assert_instance_of(Anthropic::Credentials::CredentialsFile, client.credentials)
  end

  def test_explicit_base_url_takes_precedence_over_env_and_profile
    write_user_oauth_profile(base_url: "https://profile.example.com")
    ENV["ANTHROPIC_BASE_URL"] = "https://env.example.com"

    client = Anthropic::Client.new(base_url: "https://explicit.example.com")

    assert_equal("https://explicit.example.com", client.base_url.to_s)
  end

  def test_env_base_url_takes_precedence_over_config_base_url
    ENV["ANTHROPIC_BASE_URL"] = "https://env.example.com"
    config = {
      "organization_id" => "org-123",
      "base_url" => "https://custom.anthropic.com",
      "authentication" => {
        "type" => "oidc_federation",
        "federation_rule_id" => "rule-456"
      }
    }

    client = Anthropic::Client.new(config: config)

    assert_equal("https://env.example.com", client.base_url.to_s)
  end

  def test_subclass_without_default_credentials_never_falls_back_to_first_party_base_url
    ENV["ANTHROPIC_BASE_URL"] = "http://wrong-host.example.com"
    platform_client = Class.new(Anthropic::Client) do
      private def resolve_default_credentials? = false
    end

    assert_raises(ArgumentError) { platform_client.new }
    assert_raises(ArgumentError) { platform_client.new(base_url: "") }

    client = platform_client.new(base_url: "http://localhost")
    assert_equal("http://localhost", client.base_url.to_s)
  end

  def test_config_workspace_id_sent_as_header
    client = Anthropic::Client.new(config: user_oauth_config("workspace_id" => "wrkspc_cfg"))
    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .to_return_json(status: 200, body: {content: []})

    client.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello", role: :user}],
      model: :"claude-3-opus"
    )

    assert_requested(:post, "https://api.anthropic.com/v1/messages") do |req|
      assert_equal("wrkspc_cfg", req.headers["Anthropic-Workspace-Id"])
    end
  end

  def test_per_request_workspace_id_overrides_config_workspace_id
    client = Anthropic::Client.new(config: user_oauth_config("workspace_id" => "wrkspc_cfg"))
    stub_request(:post, "https://api.anthropic.com/v1/messages")
      .to_return_json(status: 200, body: {content: []})

    client.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello", role: :user}],
      model: :"claude-3-opus",
      workspace_id: "wrkspc_req"
    )

    assert_requested(:post, "https://api.anthropic.com/v1/messages") do |req|
      assert_equal("wrkspc_req", req.headers["Anthropic-Workspace-Id"])
    end
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

  private

  def with_warning_not_yet_given(flag)
    given = Anthropic.instance_variable_get(flag)
    Anthropic.instance_variable_set(flag, false)
    yield
  ensure
    Anthropic.instance_variable_set(flag, given)
  end

  def write_user_oauth_profile(base_url: nil, name: "default", token: "profile-token")
    %w[ANTHROPIC_API_KEY ANTHROPIC_AUTH_TOKEN ANTHROPIC_PROFILE].each { ENV.delete(_1) }
    File.write(
      File.join(@tmpdir, "configs", "#{name}.json"),
      JSON.generate({"base_url" => base_url, "authentication" => {"type" => "user_oauth"}}.compact)
    )
    creds_path = File.join(@tmpdir, "credentials", "#{name}.json")
    creds = {"access_token" => token, "expires_at" => Time.now.to_i + 3600}
    File.write(creds_path, JSON.generate(creds))
    File.chmod(0o600, creds_path)
  end

  def user_oauth_config(overrides = {})
    creds_path = File.join(@tmpdir, "credentials", "test.json")
    creds = {"access_token" => "oauth-token", "expires_at" => Time.now.to_i + 3600}
    File.write(creds_path, JSON.generate(creds))
    File.chmod(0o600, creds_path)
    {"authentication" => {"type" => "user_oauth", "credentials_path" => creds_path}, **overrides}
  end
end
