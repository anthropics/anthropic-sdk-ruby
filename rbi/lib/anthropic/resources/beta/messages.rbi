# typed: strong

module Anthropic
  module Resources
    class Beta
      class Messages
        sig { returns(Anthropic::Resources::Beta::Messages::Batches) }
        attr_reader :batches

        sig do
          params(
            max_tokens: Integer,
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: Anthropic::Models::Model::Variants,
            stream: T::Boolean,
            metadata: Anthropic::Models::Beta::BetaMetadata,
            stop_sequences: T::Array[String],
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
          betas: nil,
          request_options: {}
        ); end

        sig do
          params(
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
          messages:,
          model:,
          system_: nil,
          tool_choice: nil,
          tools: nil,
          betas: nil,
          request_options: {}
        )
        end

        sig { params(client: Anthropic::Client).void }
        def initialize(client:); end
      end
    end
  end
end
