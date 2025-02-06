# typed: strong

module Anthropic
  module Resources
    class Messages
      sig { returns(Anthropic::Resources::Messages::Batches) }
      attr_reader :batches

      sig do
        params(
          max_tokens: Integer,
          messages: T::Array[Anthropic::Models::MessageParam],
          model: Anthropic::Models::Model::Variants,
          stream: T::Boolean,
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          system_: Anthropic::Models::MessageCreateParams::System::Variants,
          temperature: Float,
          tool_choice: Anthropic::Models::ToolChoice::Variants,
          tools: T::Array[Anthropic::Models::Tool],
          top_k: Integer,
          top_p: Float,
          request_options: Anthropic::RequestOpts
        ).returns(Anthropic::Models::Message)
      end
      def create(
        max_tokens:,
        messages:,
        model:,
        stream: nil,
        metadata: nil,
        stop_sequences: nil,
        system_: nil,
        temperature: nil,
        tool_choice: nil,
        tools: nil,
        top_k: nil,
        top_p: nil,
        request_options: {}
      ); end

      sig do
        params(
          messages: T::Array[Anthropic::Models::MessageParam],
          model: Anthropic::Models::Model::Variants,
          system_: Anthropic::Models::MessageCountTokensParams::System::Variants,
          tool_choice: Anthropic::Models::ToolChoice::Variants,
          tools: T::Array[Anthropic::Models::Tool],
          request_options: Anthropic::RequestOpts
        ).returns(Anthropic::Models::MessageTokensCount)
      end
      def count_tokens(messages:, model:, system_: nil, tool_choice: nil, tools: nil, request_options: {})
      end

      sig { params(client: Anthropic::Client).void }
      def initialize(client:); end
    end
  end
end
