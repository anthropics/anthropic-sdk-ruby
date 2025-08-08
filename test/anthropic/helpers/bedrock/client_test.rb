# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::BedrockClientTest < Minitest::Test
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

  def test_fit_req_to_bedrock_specs
    request_components =
      {
        method: :post,
        path: "v1/messages",
        body: {
          max_tokens: 1024,
          messages: [{role: "user", content: "Hello, Claude"}],
          model: "us.anthropic.claude-3-5-haiku-20241022-v1:0"
        },
        model: Anthropic::Models::Message,
        options: nil
      }

    client = Anthropic::BedrockClient.new(
      aws_region: "us-east-1",
      aws_access_key: "test",
      aws_secret_key: "test"
    )
    request_components = client.send(:fit_req_to_bedrock_specs!, request_components)

    assert_equal(
      {
        method: :post,
        path: "model/us.anthropic.claude-3-5-haiku-20241022-v1%3A0/invoke",
        body: {
          anthropic_version: Anthropic::BedrockClient::DEFAULT_VERSION,
          max_tokens: 1024,
          messages: [{role: "user", content: "Hello, Claude"}]
        },
        model: Anthropic::Models::Message,
        options: nil
      },
      request_components
    )
  end

  def test_header_signing
    stub_request(:post, "http://localhost/model/claude-3-7-sonnet-latest/invoke").to_return_json(
      status: 500,
      body: {}
    )

    anthropic =
      Anthropic::BedrockClient.new(
        base_url: "http://localhost",
        aws_region: "ca-west-1",
        aws_access_key: "my-aws-access",
        aws_secret_key: "my-aws-secret"
      )

    assert_raises(Anthropic::Errors::InternalServerError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-3-7-sonnet-latest"
      )
    end

    acc = []
    assert_requested(:any, /./, times: 3) do |req|
      acc << (auth = req.headers.fetch("Authorization"))
      assert_match(/^AWS4-HMAC-SHA256 Credential=my-aws-access/, auth)
    end

    assert_equal(2, acc.uniq.length)
  end

  def test_request_base_url
    uri = "https://bedrock-runtime.ca-west-1.amazonaws.com/model/claude-3-7-sonnet-latest/invoke"
    stub_request(:post, uri).to_return_json(
      status: 200,
      body: {}
    )

    anthropic =
      Anthropic::BedrockClient.new(
        aws_region: "ca-west-1",
        aws_access_key: "my-aws-access",
        aws_secret_key: "my-aws-secret"
      )

    message =
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-3-7-sonnet-latest"
      )

    assert_pattern do
      message => Anthropic::Models::Message
    end
  end
end
