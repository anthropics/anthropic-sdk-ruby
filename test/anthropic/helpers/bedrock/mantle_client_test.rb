# frozen_string_literal: true

require_relative "../../test_helper"
require "aws-sdk-core"

class Anthropic::Test::BedrockMantleClientTest < Minitest::Test
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
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_kind_of(Anthropic::BedrockMantleClient, client)
  end

  def test_sigv4_mode_via_explicit_credentials
    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "AKIAIOSFODNN7EXAMPLE",
      aws_secret_access_key: "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
      aws_region: "us-east-1"
    )
    assert_kind_of(Anthropic::BedrockMantleClient, client)
  end

  def test_sigv4_mode_via_aws_profile
    mock_creds = Aws::Credentials.new("fake-access", "fake-secret")
    Aws::SharedCredentials.stub(:new, mock_creds) do
      client = Anthropic::BedrockMantleClient.new(
        aws_profile: "my-profile",
        aws_region: "us-east-1"
      )
      assert_kind_of(Anthropic::BedrockMantleClient, client)
    end
  end

  def test_partial_credentials_raises
    assert_raises(ArgumentError) do
      Anthropic::BedrockMantleClient.new(
        aws_access_key: "AKIA",
        aws_region: "us-east-1"
      )
    end
  end

  # ---------------------------------------------------------------------------
  # Env var fallback tests
  # ---------------------------------------------------------------------------

  def test_api_key_from_mantle_env
    ENV["AWS_BEARER_TOKEN_BEDROCK"] = "mantle-key"
    client = Anthropic::BedrockMantleClient.new(base_url: "http://localhost")
    assert_equal(false, client.instance_variable_get(:@use_sig_v4))
  ensure
    ENV.delete("AWS_BEARER_TOKEN_BEDROCK")
  end

  def test_api_key_falls_back_to_aws_env
    ENV["ANTHROPIC_AWS_API_KEY"] = "aws-fallback-key"
    client = Anthropic::BedrockMantleClient.new(base_url: "http://localhost")
    assert_equal(false, client.instance_variable_get(:@use_sig_v4))
  ensure
    ENV.delete("ANTHROPIC_AWS_API_KEY")
  end

  def test_mantle_api_key_env_overrides_aws_env
    ENV["AWS_BEARER_TOKEN_BEDROCK"] = "mantle-key"
    ENV["ANTHROPIC_AWS_API_KEY"] = "aws-key"
    client = Anthropic::BedrockMantleClient.new(base_url: "http://localhost")
    assert_equal(false, client.instance_variable_get(:@use_sig_v4))
  ensure
    ENV.delete("AWS_BEARER_TOKEN_BEDROCK")
    ENV.delete("ANTHROPIC_AWS_API_KEY")
  end

  # ---------------------------------------------------------------------------
  # Region and base URL tests
  # ---------------------------------------------------------------------------

  def test_base_url_derived_from_region
    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      aws_region: "us-west-2"
    )
    assert_equal("https://bedrock-mantle.us-west-2.api.aws/anthropic", client.base_url.to_s)
  end

  def test_base_url_from_constructor_overrides_derived
    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      aws_region: "us-east-1",
      base_url: "http://localhost:9000"
    )
    assert_equal("http://localhost:9000", client.base_url.to_s)
  end

  def test_base_url_from_env
    ENV["ANTHROPIC_BEDROCK_MANTLE_BASE_URL"] = "http://custom.mantle.example.com"
    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      aws_region: "us-east-1"
    )
    assert_equal("http://custom.mantle.example.com", client.base_url.to_s)
  ensure
    ENV.delete("ANTHROPIC_BEDROCK_MANTLE_BASE_URL")
  end

  def test_missing_region_in_sigv4_mode_raises
    assert_raises(ArgumentError) do
      Anthropic::BedrockMantleClient.new(
        aws_access_key: "AKIA",
        aws_secret_access_key: "secret"
      )
    end
  end

  # ---------------------------------------------------------------------------
  # Request behavior tests
  # ---------------------------------------------------------------------------

  def test_sigv4_request_includes_bedrock_mantle_service_name
    stub_request(:post, "https://bedrock-mantle.us-east-1.api.aws/anthropic/v1/messages").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "my-aws-access",
      aws_secret_access_key: "my-aws-secret",
      aws_region: "us-east-1"
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
      assert_match(/^AWS4-HMAC-SHA256/, auth)
      assert_match(/bedrock-mantle/, auth)
    end
  end

  # ---------------------------------------------------------------------------
  # skip_auth tests
  # ---------------------------------------------------------------------------

  def test_skip_auth_request_has_no_auth_headers
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::BedrockMantleClient.new(skip_auth: true, base_url: "http://localhost")

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
  # ANTHROPIC_API_KEY leak prevention
  # ---------------------------------------------------------------------------

  def test_sigv4_does_not_leak_anthropic_api_key
    ENV["ANTHROPIC_API_KEY"] = "should-not-appear"

    stub_request(:post, "https://bedrock-mantle.us-east-1.api.aws/anthropic/v1/messages").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "my-aws-access",
      aws_secret_access_key: "my-aws-secret",
      aws_region: "us-east-1"
    )

    assert_raises(Anthropic::Errors::InternalServerError) do
      client.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-sonnet-4-20250514"
      )
    end

    assert_requested(:any, /./, times: 3) do |req|
      assert_nil(req.headers["X-Api-Key"])
      assert_match(/^AWS4-HMAC-SHA256/, req.headers.fetch("Authorization"))
    end
  ensure
    ENV.delete("ANTHROPIC_API_KEY")
  end

  # ---------------------------------------------------------------------------
  # Type restriction tests
  # ---------------------------------------------------------------------------

  def test_messages_resource_available
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_respond_to(client, :messages)
    assert_kind_of(Anthropic::Resources::Messages, client.messages)
  end

  def test_beta_messages_available
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_respond_to(client.beta, :messages)
    assert_kind_of(Anthropic::Resources::Beta::Messages, client.beta.messages)
  end

  def test_completions_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.completions }
  end

  def test_models_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.models }
  end

  def test_beta_models_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.beta.models }
  end

  def test_beta_files_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.beta.files }
  end

  def test_beta_skills_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.beta.skills }
  end
end
