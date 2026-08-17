# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../support/platform_client_env"
require "aws-sdk-core"

class Anthropic::Test::AWSClientTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API
  include Anthropic::Test::PlatformClientEnv

  PLATFORM_ENV_KEYS = %w[
    AWS_REGION
    AWS_DEFAULT_REGION
    ANTHROPIC_AWS_API_KEY
    ANTHROPIC_AWS_WORKSPACE_ID
    ANTHROPIC_AWS_BASE_URL
  ].freeze

  def before_all
    super
    WebMock.enable!
  end

  def after_all
    WebMock.disable!
    super
  end

  def teardown
    WebMock.reset!
    super
  end

  # ---------------------------------------------------------------------------
  # Initialization tests
  # ---------------------------------------------------------------------------

  def test_api_key_mode_via_constructor
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", base_url: "http://localhost")
    assert_kind_of(Anthropic::AWSClient, client)
  end

  def test_sigv4_mode_via_explicit_credentials
    client = Anthropic::AWSClient.new(
      aws_access_key: "AKIAIOSFODNN7EXAMPLE",
      aws_secret_access_key: "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
      aws_region: "us-east-1",
      workspace_id: "ws-xxx"
    )
    assert_kind_of(Anthropic::AWSClient, client)
  end

  def test_sigv4_mode_via_aws_profile
    mock_creds = Aws::Credentials.new("fake-access", "fake-secret")
    with_shared_config(sso_credentials: mock_creds) do
      client = Anthropic::AWSClient.new(
        aws_profile: "my-profile",
        aws_region: "us-east-1",
        workspace_id: "ws-xxx"
      )
      assert_kind_of(Anthropic::AWSClient, client)
    end
  end

  def test_api_key_from_env
    ENV["ANTHROPIC_AWS_API_KEY"] = "sk-ant-test"
    ENV["ANTHROPIC_AWS_WORKSPACE_ID"] = "ws-test"
    client = Anthropic::AWSClient.new(base_url: "http://localhost")
    assert_kind_of(Anthropic::AWSClient, client)
  ensure
    ENV.delete("ANTHROPIC_AWS_API_KEY")
    ENV.delete("ANTHROPIC_AWS_WORKSPACE_ID")
  end

  def test_default_credential_chain
    # No auth args, no env var — falls through to default AWS credential chain (instance profile, etc.)
    # Stub InstanceProfileCredentials to avoid network calls to EC2 metadata service
    mock_creds = Aws::Credentials.new("fake-access", "fake-secret")
    Aws::InstanceProfileCredentials.stub(:new, mock_creds) do
      client = Anthropic::AWSClient.new(aws_region: "us-east-1", workspace_id: "ws-xxx")
      assert_kind_of(Anthropic::AWSClient, client)
      assert_equal(true, client.instance_variable_get(:@use_sig_v4))
    end
  end

  def test_partial_credentials_access_key_only_raises
    assert_raises(ArgumentError) do
      Anthropic::AWSClient.new(
        aws_access_key: "AKIA",
        aws_region: "us-east-1",
        workspace_id: "ws-xxx"
      )
    end
  end

  def test_partial_credentials_secret_key_only_raises
    assert_raises(ArgumentError) do
      Anthropic::AWSClient.new(
        aws_secret_access_key: "secret",
        aws_region: "us-east-1",
        workspace_id: "ws-xxx"
      )
    end
  end

  # ---------------------------------------------------------------------------
  # Auth precedence tests
  # ---------------------------------------------------------------------------

  def test_explicit_api_key_takes_precedence_over_env
    ENV["ANTHROPIC_AWS_API_KEY"] = "sk-ant-from-env"
    client = Anthropic::AWSClient.new(api_key: "sk-ant-explicit", workspace_id: "ws-xxx", base_url: "http://localhost")
    # explicit api_key wins; client is in API key mode (no SigV4)
    assert_equal(false, client.instance_variable_get(:@use_sig_v4))
  ensure
    ENV.delete("ANTHROPIC_AWS_API_KEY")
  end

  def test_explicit_aws_keys_suppress_api_key_env
    ENV["ANTHROPIC_AWS_API_KEY"] = "sk-ant-from-env"
    client = Anthropic::AWSClient.new(
      aws_access_key: "AKIAIOSFODNN7EXAMPLE",
      aws_secret_access_key: "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
      aws_region: "us-east-1",
      workspace_id: "ws-xxx"
    )
    assert_equal(true, client.instance_variable_get(:@use_sig_v4))
  ensure
    ENV.delete("ANTHROPIC_AWS_API_KEY")
  end

  def test_explicit_aws_profile_suppresses_api_key_env
    ENV["ANTHROPIC_AWS_API_KEY"] = "sk-ant-from-env"
    mock_creds = Aws::Credentials.new("fake-access", "fake-secret")
    with_shared_config(sso_credentials: mock_creds) do
      client = Anthropic::AWSClient.new(
        aws_profile: "my-profile",
        aws_region: "us-east-1",
        workspace_id: "ws-xxx"
      )
      assert_equal(true, client.instance_variable_get(:@use_sig_v4))
    end
  ensure
    ENV.delete("ANTHROPIC_AWS_API_KEY")
  end

  def test_api_key_env_used_when_no_constructor_auth_args
    ENV["ANTHROPIC_AWS_API_KEY"] = "sk-ant-from-env"
    client = Anthropic::AWSClient.new(base_url: "http://localhost", workspace_id: "ws-xxx")
    assert_equal(false, client.instance_variable_get(:@use_sig_v4))
  ensure
    ENV.delete("ANTHROPIC_AWS_API_KEY")
  end

  # ---------------------------------------------------------------------------
  # Region and base URL tests
  # ---------------------------------------------------------------------------

  def test_region_from_constructor
    client = Anthropic::AWSClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      aws_region: "eu-west-1",
      workspace_id: "ws-xxx"
    )
    assert_equal("eu-west-1", client.aws_region)
  end

  def test_region_from_env
    ENV["AWS_REGION"] = "ap-southeast-1"
    client = Anthropic::AWSClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      workspace_id: "ws-xxx"
    )
    assert_equal("ap-southeast-1", client.aws_region)
  ensure
    ENV.delete("AWS_REGION")
  end

  def test_region_from_default_region_env
    ENV["AWS_DEFAULT_REGION"] = "eu-central-1"
    client = Anthropic::AWSClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      workspace_id: "ws-xxx"
    )
    assert_equal("eu-central-1", client.aws_region)
  ensure
    ENV.delete("AWS_DEFAULT_REGION")
  end

  def test_aws_region_env_takes_precedence_over_default_region
    ENV["AWS_REGION"] = "us-west-2"
    ENV["AWS_DEFAULT_REGION"] = "eu-central-1"
    client = Anthropic::AWSClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      workspace_id: "ws-xxx"
    )
    assert_equal("us-west-2", client.aws_region)
  ensure
    ENV.delete("AWS_REGION")
    ENV.delete("AWS_DEFAULT_REGION")
  end

  def test_base_url_from_constructor_overrides_derived
    client = Anthropic::AWSClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      aws_region: "us-east-1",
      workspace_id: "ws-xxx",
      base_url: "http://localhost:9000"
    )
    assert_equal("http://localhost:9000", client.base_url.to_s)
  end

  def test_base_url_from_env
    ENV["ANTHROPIC_AWS_BASE_URL"] = "http://custom.example.com"
    client = Anthropic::AWSClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      aws_region: "us-east-1",
      workspace_id: "ws-xxx"
    )
    assert_equal("http://custom.example.com", client.base_url.to_s)
  ensure
    ENV.delete("ANTHROPIC_AWS_BASE_URL")
  end

  def test_missing_region_in_sigv4_mode_raises
    assert_raises(ArgumentError) do
      Anthropic::AWSClient.new(
        aws_access_key: "AKIA",
        aws_secret_access_key: "secret",
        workspace_id: "ws-xxx"
        # no aws_region, no AWS_REGION env var
      )
    end
  end

  def test_api_key_mode_without_region_works_with_base_url
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", base_url: "http://localhost")
    assert_kind_of(Anthropic::AWSClient, client)
  end

  def test_api_key_mode_derives_base_url_from_region
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", aws_region: "us-east-1")
    assert_equal("https://aws-external-anthropic.us-east-1.api.aws", client.base_url.to_s)
  end

  def test_api_key_mode_without_base_url_or_region_raises
    assert_raises(ArgumentError) do
      Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx")
    end
  end

  def test_false_base_url_derives_from_region_not_first_party_env
    with_env("ANTHROPIC_BASE_URL" => "http://wrong-host.example.com") do
      client = Anthropic::AWSClient.new(
        api_key: "sk-ant-xxx", workspace_id: "ws-xxx", aws_region: "us-east-1", base_url: false
      )
      assert_equal("https://aws-external-anthropic.us-east-1.api.aws", client.base_url.to_s)

      assert_raises(ArgumentError) do
        Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", base_url: false)
      end
    end
  end

  def test_empty_base_url_env_derives_from_region
    ENV["ANTHROPIC_AWS_BASE_URL"] = ""
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", aws_region: "us-east-1")
    assert_equal("https://aws-external-anthropic.us-east-1.api.aws", client.base_url.to_s)
  end

  # ---------------------------------------------------------------------------
  # Workspace ID tests
  # ---------------------------------------------------------------------------

  def test_workspace_id_from_constructor
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-from-arg", base_url: "http://localhost")
    assert_equal("ws-from-arg", client.workspace_id)
  end

  def test_workspace_id_from_env
    ENV["ANTHROPIC_AWS_WORKSPACE_ID"] = "ws-from-env"
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_equal("ws-from-env", client.workspace_id)
  ensure
    ENV.delete("ANTHROPIC_AWS_WORKSPACE_ID")
  end

  def test_missing_workspace_id_raises
    assert_raises(ArgumentError) do
      Anthropic::AWSClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
      # no workspace_id, no ANTHROPIC_AWS_WORKSPACE_ID env var
    end
  end

  # ---------------------------------------------------------------------------
  # Request behavior tests
  # ---------------------------------------------------------------------------

  def test_sigv4_request_includes_authorization_header
    stub_request(:post, "https://aws-external-anthropic.us-east-1.api.aws/v1/messages").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::AWSClient.new(
      aws_access_key: "my-aws-access",
      aws_secret_access_key: "my-aws-secret",
      aws_region: "us-east-1",
      workspace_id: "ws-test-123"
    )

    assert_raises(Anthropic::Errors::InternalServerError) do
      client.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-sonnet-4-20250514"
      )
    end

    assert_requested(:any, /./, times: 3) do |req|
      auth = req.headers.fetch("Authorization")
      assert_match(/^AWS4-HMAC-SHA256 Credential=my-aws-access/, auth)
    end
  end

  def test_sigv4_signs_multipart_enumerable_body
    # Multipart bodies are produced as a lazy Enumerable by Util.encode_content.
    # SigV4 signing must materialize them; otherwise Aws::Sigv4::Signer raises
    # "TypeError: no implicit conversion of Enumerator into String", and even if
    # it didn't, the consumed enumerator would replay empty over the wire.
    stub_request(:post, "https://aws-external-anthropic.us-east-1.api.aws/v1/files?beta=true").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::AWSClient.new(
      aws_access_key: "my-aws-access",
      aws_secret_access_key: "my-aws-secret",
      aws_region: "us-east-1",
      workspace_id: "ws-test-123",
      max_retries: 0
    )

    file = Anthropic::FilePart.new(StringIO.new("hello world"), filename: "hello.txt")
    assert_raises(Anthropic::Errors::InternalServerError) do
      client.beta.files.upload(file: file)
    end

    assert_requested(:any, /./, times: 1) do |req|
      auth = req.headers.fetch("Authorization")
      assert_match(/^AWS4-HMAC-SHA256 Credential=my-aws-access/, auth)
      assert_match(%r{^multipart/form-data; boundary=}, req.headers.fetch("Content-Type"))
      # Body must be the materialized multipart payload, not an empty/consumed stream.
      assert_includes(req.body, "hello world")
      assert_includes(req.body, "hello.txt")
    end
  end

  def test_api_key_mode_request_includes_x_api_key_header
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::AWSClient.new(
      api_key: "sk-ant-test",
      workspace_id: "ws-test-123",
      base_url: "http://localhost"
    )

    assert_raises(Anthropic::Errors::InternalServerError) do
      client.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-sonnet-4-20250514"
      )
    end

    assert_requested(:any, /./, times: 3) do |req|
      assert_equal("sk-ant-test", req.headers.fetch("X-Api-Key"))
    end
  end

  def test_workspace_id_header_present_on_requests
    stub_request(:post, "https://aws-external-anthropic.us-east-1.api.aws/v1/messages").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::AWSClient.new(
      aws_access_key: "my-aws-access",
      aws_secret_access_key: "my-aws-secret",
      aws_region: "us-east-1",
      workspace_id: "ws-test-456"
    )

    assert_raises(Anthropic::Errors::InternalServerError) do
      client.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-sonnet-4-20250514"
      )
    end

    assert_requested(:any, /./, times: 3) do |req|
      assert_equal("ws-test-456", req.headers.fetch("Anthropic-Workspace-Id"))
    end
  end

  def test_workspace_id_header_not_overridable_by_extra_headers
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::AWSClient.new(
      api_key: "sk-ant-test",
      workspace_id: "ws-real",
      base_url: "http://localhost"
    )

    assert_raises(Anthropic::Errors::InternalServerError) do
      client.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-sonnet-4-20250514",
        request_options: {extra_headers: {"anthropic-workspace-id" => "ws-attacker"}}
      )
    end

    assert_requested(:any, /./, times: 3) do |req|
      assert_equal("ws-real", req.headers.fetch("Anthropic-Workspace-Id"))
    end
  end

  def test_default_base_url_uses_region
    client = Anthropic::AWSClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      aws_region: "us-west-2",
      workspace_id: "ws-xxx"
    )
    assert_equal("https://aws-external-anthropic.us-west-2.api.aws", client.base_url.to_s)
  end

  # ---------------------------------------------------------------------------
  # skip_auth tests
  # ---------------------------------------------------------------------------

  def test_skip_auth_no_workspace_id_required
    client = Anthropic::AWSClient.new(skip_auth: true, base_url: "http://localhost")
    assert_kind_of(Anthropic::AWSClient, client)
    assert_nil(client.workspace_id)
  end

  def test_skip_auth_no_sigv4
    client = Anthropic::AWSClient.new(skip_auth: true, base_url: "http://localhost")
    assert_equal(false, client.instance_variable_get(:@use_sig_v4))
  end

  def test_skip_auth_request_has_no_auth_headers
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::AWSClient.new(skip_auth: true, base_url: "http://localhost")

    assert_raises(Anthropic::Errors::InternalServerError) do
      client.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-sonnet-4-20250514"
      )
    end

    assert_requested(:any, /./, times: 3) do |req|
      assert_nil(req.headers["Authorization"])
      assert_nil(req.headers["X-Api-Key"])
    end
  end

  # ---------------------------------------------------------------------------
  # Resource availability tests
  # ---------------------------------------------------------------------------

  def test_messages_resource_available
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", base_url: "http://localhost")
    assert_kind_of(Anthropic::Resources::Messages, client.messages)
  end

  def test_models_resource_available
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", base_url: "http://localhost")
    assert_kind_of(Anthropic::Resources::Models, client.models)
  end

  def test_beta_resource_available
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", base_url: "http://localhost")
    assert_kind_of(Anthropic::Resources::Beta, client.beta)
  end

  # The gateway serves the full first-party API, so — unlike the Bedrock and
  # Google Cloud clients — nothing the parent wires up is withheld here.
  def test_completions_resource_available
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", base_url: "http://localhost")
    assert_kind_of(Anthropic::Resources::Completions, client.completions)
  end

  # ---------------------------------------------------------------------------
  # Generic client construction shared with the first-party client
  # ---------------------------------------------------------------------------

  # ANTHROPIC_CUSTOM_HEADERS applies to gateway clients like any other client.
  def test_custom_headers_env_applies
    with_env("ANTHROPIC_CUSTOM_HEADERS" => "x-custom-test: from-env") do
      stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 200, body: {})

      client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", base_url: "http://localhost")
      client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

      assert_requested(:post, "http://localhost/v1/messages", times: 1) do |req|
        assert_equal("from-env", req.headers.transform_keys(&:downcase)["x-custom-test"])
        true
      end
    end
  end

  # The webhook signing key defaults from the env like the first-party client.
  # It only verifies inbound webhook payloads; nothing goes on the wire.
  def test_webhook_key_env_default
    with_env("ANTHROPIC_WEBHOOK_SIGNING_KEY" => "whsec_fake_env_value") do
      client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", base_url: "http://localhost")
      assert_equal("whsec_fake_env_value", client.webhook_key)
    end
  end

  # ---------------------------------------------------------------------------
  # First-party credential isolation
  # ---------------------------------------------------------------------------

  # First-party static env keys and ANTHROPIC_BASE_URL must never fold into a
  # gateway client. `skip_auth` is the sharpest probe: with SigV4 off, a key
  # the parent picked up from the env would go straight onto the wire.
  def test_does_not_fold_env_static_keys
    env = {
      "ANTHROPIC_API_KEY" => "env-api-key",
      "ANTHROPIC_AUTH_TOKEN" => "env-auth-token",
      "ANTHROPIC_BASE_URL" => "http://wrong-host.example.com"
    }
    with_env(env) do
      stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 200, body: {})

      client = Anthropic::AWSClient.new(skip_auth: true, base_url: "http://localhost")
      assert_nil(client.api_key)
      assert_nil(client.auth_token)
      assert_nil(client.credentials)
      assert_nil(client.token_cache)
      assert_equal("http://localhost", client.base_url.to_s)

      client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

      assert_requested(:post, "http://localhost/v1/messages", times: 1) do |req|
        headers = req.headers.transform_keys(&:downcase)
        refute(headers.key?("x-api-key"))
        refute(headers.key?("authorization"))
        true
      end
    end
  end

  # SigV4 mode must not build a first-party credential provider either — the
  # env keys are simply not consulted, whatever the auth mode.
  def test_sigv4_mode_ignores_env_static_keys
    with_env("ANTHROPIC_API_KEY" => "env-api-key", "ANTHROPIC_AUTH_TOKEN" => "env-auth-token") do
      uri = "https://aws-external-anthropic.us-east-1.api.aws/v1/messages"
      stub_request(:post, uri).to_return_json(status: 200, body: {})

      client = Anthropic::AWSClient.new(
        aws_access_key: "my-aws-access",
        aws_secret_access_key: "my-aws-secret",
        aws_region: "us-east-1",
        workspace_id: "ws-test-123"
      )
      assert_nil(client.api_key)
      assert_nil(client.auth_token)
      assert_nil(client.credentials)
      assert_nil(client.token_cache)

      client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

      assert_requested(:post, uri, times: 1) do |req|
        headers = req.headers.transform_keys(&:downcase)
        refute(headers.key?("x-api-key"))
        assert_match(/^AWS4-HMAC-SHA256 Credential=my-aws-access/, headers.fetch("authorization"))
        true
      end
    end
  end

  # The first-party config store (`~/.config/anthropic`, `ANTHROPIC_CONFIG_DIR`)
  # must never be consulted: no store bearer, no store-derived
  # `anthropic-workspace-id`, no OAuth beta header, and no store `base_url`
  # redirecting gateway traffic.
  def test_does_not_consult_first_party_config_store
    with_fake_config_store do
      stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 200, body: {})

      client = Anthropic::AWSClient.new(skip_auth: true, base_url: "http://localhost")
      assert_nil(client.credentials)
      assert_nil(client.token_cache)
      assert_equal("http://localhost", client.base_url.to_s)

      client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

      assert_requested(:post, "http://localhost/v1/messages", times: 1) do |req|
        headers = req.headers.transform_keys(&:downcase)
        refute(headers.key?("authorization"))
        refute(headers.key?("x-api-key"))
        refute(headers.key?("anthropic-workspace-id"))
        true
      end
    end
  end

  def test_sigv4_mode_does_not_consult_first_party_config_store
    with_fake_config_store do
      uri = "https://aws-external-anthropic.us-east-1.api.aws/v1/messages"
      stub_request(:post, uri).to_return_json(status: 200, body: {})

      client = Anthropic::AWSClient.new(
        aws_access_key: "my-aws-access",
        aws_secret_access_key: "my-aws-secret",
        aws_region: "us-east-1",
        workspace_id: "ws-test-123"
      )
      assert_nil(client.credentials)
      assert_nil(client.token_cache)
      assert_equal("https://aws-external-anthropic.us-east-1.api.aws", client.base_url.to_s)

      client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

      assert_requested(:post, uri, times: 1) do |req|
        headers = req.headers.transform_keys(&:downcase)
        assert_match(/^AWS4-HMAC-SHA256 Credential=my-aws-access/, headers.fetch("authorization"))
        assert_equal("ws-test-123", headers["anthropic-workspace-id"])
        refute(headers.key?("x-api-key"))
        true
      end
    end
  end

  # ---------------------------------------------------------------------------
  # Profile credential resolution tests
  # ---------------------------------------------------------------------------

  def test_profile_resolves_sso_credentials
    sso_creds = Aws::Credentials.new("sso-access", "sso-secret")
    with_shared_config(sso_credentials: sso_creds) do
      client = Anthropic::AWSClient.new(
        aws_profile: "sso-profile",
        aws_region: "us-east-1",
        workspace_id: "ws-xxx"
      )
      signer = client.instance_variable_get(:@signer)
      resolved = signer.credentials_provider
      assert_equal("sso-access", resolved.access_key_id)
      assert_equal("sso-secret", resolved.secret_access_key)
    end
  end

  def test_profile_resolves_assume_role_web_identity_credentials
    web_id_creds = Aws::Credentials.new("webid-access", "webid-secret")
    with_shared_config(web_identity_credentials: web_id_creds) do
      client = Anthropic::AWSClient.new(
        aws_profile: "webid-profile",
        aws_region: "us-east-1",
        workspace_id: "ws-xxx"
      )
      signer = client.instance_variable_get(:@signer)
      resolved = signer.credentials_provider
      assert_equal("webid-access", resolved.access_key_id)
    end
  end

  def test_profile_resolves_assume_role_credentials
    assume_creds = Aws::Credentials.new("assume-access", "assume-secret")
    with_shared_config(assume_role_credentials: assume_creds) do
      client = Anthropic::AWSClient.new(
        aws_profile: "assume-profile",
        aws_region: "us-east-1",
        workspace_id: "ws-xxx"
      )
      signer = client.instance_variable_get(:@signer)
      resolved = signer.credentials_provider
      assert_equal("assume-access", resolved.access_key_id)
    end
  end

  def test_profile_resolves_process_credentials
    process_creds = Aws::Credentials.new("process-access", "process-secret")
    with_shared_config(credential_process: "/usr/bin/get-creds") do
      Aws::ProcessCredentials.stub(:new, process_creds) do
        client = Anthropic::AWSClient.new(
          aws_profile: "process-profile",
          aws_region: "us-east-1",
          workspace_id: "ws-xxx"
        )
        signer = client.instance_variable_get(:@signer)
        resolved = signer.credentials_provider
        assert_equal("process-access", resolved.access_key_id)
      end
    end
  end

  def test_profile_resolves_static_shared_credentials
    static_creds = Aws::Credentials.new("static-access", "static-secret")
    # config_enabled but no SSO/assume-role/process match → falls through to SharedCredentials
    with_shared_config do
      Aws::SharedCredentials.stub(:new, static_creds) do
        client = Anthropic::AWSClient.new(
          aws_profile: "static-profile",
          aws_region: "us-east-1",
          workspace_id: "ws-xxx"
        )
        signer = client.instance_variable_get(:@signer)
        resolved = signer.credentials_provider
        assert_equal("static-access", resolved.access_key_id)
      end
    end
  end

  def test_profile_resolution_priority_order
    # web_identity should be tried before SSO
    web_id_creds = Aws::Credentials.new("webid-access", "webid-secret")
    sso_creds = Aws::Credentials.new("sso-access", "sso-secret")
    with_shared_config(web_identity_credentials: web_id_creds, sso_credentials: sso_creds) do
      client = Anthropic::AWSClient.new(
        aws_profile: "multi-profile",
        aws_region: "us-east-1",
        workspace_id: "ws-xxx"
      )
      signer = client.instance_variable_get(:@signer)
      resolved = signer.credentials_provider
      assert_equal("webid-access", resolved.access_key_id)
    end
  end

  def test_profile_sso_preferred_over_assume_role
    sso_creds = Aws::Credentials.new("sso-access", "sso-secret")
    assume_creds = Aws::Credentials.new("assume-access", "assume-secret")
    with_shared_config(sso_credentials: sso_creds, assume_role_credentials: assume_creds) do
      client = Anthropic::AWSClient.new(
        aws_profile: "multi-profile",
        aws_region: "us-east-1",
        workspace_id: "ws-xxx"
      )
      signer = client.instance_variable_get(:@signer)
      resolved = signer.credentials_provider
      assert_equal("sso-access", resolved.access_key_id)
    end
  end

  def test_profile_skips_config_when_disabled
    static_creds = Aws::Credentials.new("static-access", "static-secret")
    sso_creds = Aws::Credentials.new("sso-access", "sso-secret")
    # config disabled → SSO is skipped, falls through to SharedCredentials
    with_shared_config(config_enabled: false, sso_credentials: sso_creds) do
      Aws::SharedCredentials.stub(:new, static_creds) do
        client = Anthropic::AWSClient.new(
          aws_profile: "some-profile",
          aws_region: "us-east-1",
          workspace_id: "ws-xxx"
        )
        signer = client.instance_variable_get(:@signer)
        resolved = signer.credentials_provider
        assert_equal("static-access", resolved.access_key_id)
      end
    end
  end

  def test_profile_raises_when_no_credentials_resolved
    with_shared_config do
      not_set_creds = Aws::Credentials.new(nil, nil)
      Aws::SharedCredentials.stub(:new, not_set_creds) do
        error = assert_raises(ArgumentError) do
          Anthropic::AWSClient.new(
            aws_profile: "missing-profile",
            aws_region: "us-east-1",
            workspace_id: "ws-xxx"
          )
        end
        assert_includes(error.message, "missing-profile")
        assert_includes(error.message, "aws sso login")
      end
    end
  end

  def test_profile_raises_clear_error_for_no_such_profile
    with_shared_config(raise_no_such_profile: true) do
      Aws::SharedCredentials.stub(:new, ->(_) { raise Aws::Errors::NoSuchProfileError.new("nope") }) do
        error = assert_raises(ArgumentError) do
          Anthropic::AWSClient.new(
            aws_profile: "nonexistent",
            aws_region: "us-east-1",
            workspace_id: "ws-xxx"
          )
        end
        assert_includes(error.message, "nonexistent")
      end
    end
  end

  private

  # Builds a mock Aws.shared_config and stubs it for the duration of the block.
  #
  # @param config_enabled [Boolean] whether config file loading is enabled
  # @param sso_credentials [Aws::Credentials, nil] credentials returned by sso_credentials_from_config
  # @param web_identity_credentials [Aws::Credentials, nil] credentials returned by assume_role_web_identity_credentials_from_config
  # @param assume_role_credentials [Aws::Credentials, nil] credentials returned by assume_role_credentials_from_config
  # @param credential_process [String, nil] process command returned by credential_process
  # @param raise_no_such_profile [Boolean] raise NoSuchProfileError from all config methods
  def with_shared_config(
    config_enabled: true,
    sso_credentials: nil,
    web_identity_credentials: nil,
    assume_role_credentials: nil,
    credential_process: nil,
    raise_no_such_profile: false,
    &block
  )
    mock_config = Object.new

    mock_config.define_singleton_method(:config_enabled?) { config_enabled }

    mock_config.define_singleton_method(:sso_credentials_from_config) do |**_|
      raise Aws::Errors::NoSuchProfileError.new("no such profile") if raise_no_such_profile
      sso_credentials
    end

    mock_config.define_singleton_method(:assume_role_web_identity_credentials_from_config) do |**_|
      raise Aws::Errors::NoSuchProfileError.new("no such profile") if raise_no_such_profile
      web_identity_credentials
    end

    mock_config.define_singleton_method(:assume_role_credentials_from_config) do |**_|
      raise Aws::Errors::NoSuchProfileError.new("no such profile") if raise_no_such_profile
      assume_role_credentials
    end

    mock_config.define_singleton_method(:credential_process) do |**_|
      raise Aws::Errors::NoSuchProfileError.new("no such profile") if raise_no_such_profile
      credential_process
    end

    Aws.stub(:shared_config, mock_config, &block)
  end
end
