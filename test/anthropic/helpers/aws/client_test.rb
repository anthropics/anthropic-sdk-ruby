# frozen_string_literal: true

require_relative "../../test_helper"
require "aws-sdk-core"

class Anthropic::Test::AWSClientTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

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
    Aws::SharedCredentials.stub(:new, mock_creds) do
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
    Aws::SharedCredentials.stub(:new, mock_creds) do
      client = Anthropic::AWSClient.new(aws_profile: "my-profile", aws_region: "us-east-1", workspace_id: "ws-xxx")
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
    assert_respond_to(client, :messages)
  end

  def test_models_resource_available
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", base_url: "http://localhost")
    assert_respond_to(client, :models)
  end

  def test_beta_resource_available
    client = Anthropic::AWSClient.new(api_key: "sk-ant-xxx", workspace_id: "ws-xxx", base_url: "http://localhost")
    assert_respond_to(client, :beta)
  end
end
