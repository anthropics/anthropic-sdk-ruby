# typed: strong

module Anthropic
  module Resources
    class Messages
      sig { returns(Anthropic::Resources::Messages::Batches) }
      attr_reader :batches

      sig do
        params(
          params: T.any(Anthropic::Models::MessageCreateParams, T::Hash[Symbol, T.anything]),
          max_tokens: Integer,
          messages: T::Array[Anthropic::Models::MessageParam],
          model: Anthropic::Models::Model::Variants,
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          stream: T::Boolean,
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
        params,
        max_tokens:,
        messages:,
        model:,
        metadata:,
        stop_sequences:,
        stream:,
        system_:,
        temperature:,
        tool_choice:,
        tools:,
        top_k:,
        top_p:,
        request_options: {}
      ); end

      sig do
        params(
          params: T.any(Anthropic::Models::MessageCountTokensParams, T::Hash[Symbol, T.anything]),
          messages: T::Array[Anthropic::Models::MessageParam],
          model: Anthropic::Models::Model::Variants,
          system_: Anthropic::Models::MessageCountTokensParams::System::Variants,
          tool_choice: Anthropic::Models::ToolChoice::Variants,
          tools: T::Array[Anthropic::Models::Tool],
          request_options: Anthropic::RequestOpts
        ).returns(Anthropic::Models::MessageTokensCount)
      end
      def count_tokens(params, messages:, model:, system_:, tool_choice:, tools:, request_options: {}); end

      sig { params(client: Anthropic::Client).void }
      def initialize(client:); end
    end
  end
end
