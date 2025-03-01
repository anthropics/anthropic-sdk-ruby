# frozen_string_literal: true

require_relative "../test_helper"

module Anthropic
  module Bedrock
    class ClientTest < Minitest::Test
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

        client = Anthropic::Bedrock::Client.new(
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
              anthropic_version: Anthropic::Bedrock::Client::DEFAULT_VERSION,
              max_tokens: 1024,
              messages: [{role: "user", content: "Hello, Claude"}]
            },
            model: Anthropic::Models::Message,
            options: nil
          },
          request_components
        )
      end
    end
  end
end
