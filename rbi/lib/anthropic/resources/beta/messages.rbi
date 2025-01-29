# typed: strong

module Anthropic
  module Resources
    class Beta
      class Messages
        sig { returns(Anthropic::Resources::Beta::Messages::Batches) }
        attr_reader :batches

        sig do
          params(
            params: T.any(Anthropic::Models::Beta::MessageCreateParams, T::Hash[Symbol, T.anything]),
            max_tokens: Integer,
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: Anthropic::Models::Model::Variants,
            metadata: Anthropic::Models::Beta::BetaMetadata,
            stop_sequences: T::Array[String],
            stream: T::Boolean,
            system_: Anthropic::Models::Beta::MessageCreateParams::System::Variants,
            temperature: Float,
            tool_choice: Anthropic::Models::Beta::BetaToolChoice::Variants,
            tools: T::Array[Anthropic::Models::Beta::BetaToolUnion::Variants],
            top_k: Integer,
            top_p: Float,
            betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
            request_options: Anthropic::RequestOpts
          ).returns(Anthropic::Models::Beta::BetaMessage)
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
          betas:,
          request_options: {}
        ); end

        sig do
          params(
            params: T.any(Anthropic::Models::Beta::MessageCountTokensParams, T::Hash[Symbol, T.anything]),
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: Anthropic::Models::Model::Variants,
            system_: Anthropic::Models::Beta::MessageCountTokensParams::System::Variants,
            tool_choice: Anthropic::Models::Beta::BetaToolChoice::Variants,
            tools: T::Array[Anthropic::Models::Beta::MessageCountTokensParams::Tool::Variants],
            betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
            request_options: Anthropic::RequestOpts
          ).returns(Anthropic::Models::Beta::BetaMessageTokensCount)
        end
        def count_tokens(
          params,
          messages:,
          model:,
          system_:,
          tool_choice:,
          tools:,
          betas:,
          request_options: {}
        )
        end

        sig { params(client: Anthropic::Client).void }
        def initialize(client:); end
      end
    end
  end
end
