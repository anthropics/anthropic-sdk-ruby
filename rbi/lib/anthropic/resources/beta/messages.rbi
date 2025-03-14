# typed: strong

module Anthropic
  module Resources
    class Beta
      class Messages
        sig { returns(Anthropic::Resources::Beta::Messages::Batches) }
        def batches
        end

        # Send a structured list of input messages with text and/or image content, and the
        #   model will generate the next message in the conversation.
        #
        #   The Messages API can be used for either single queries or stateless multi-turn
        #   conversations.
        #
        #   Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
        sig do
          params(
            max_tokens: Integer,
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: T.any(Symbol, String),
            metadata: Anthropic::Models::Beta::BetaMetadata,
            stop_sequences: T::Array[String],
            system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
            temperature: Float,
            thinking: T.any(
              Anthropic::Models::Beta::BetaThinkingConfigEnabled,
              Anthropic::Models::Beta::BetaThinkingConfigDisabled
            ),
            tool_choice: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool,
              Anthropic::Models::Beta::BetaToolChoiceNone
            ),
            tools: T::Array[
            T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022,
              Anthropic::Models::Beta::BetaToolComputerUse20250124,
              Anthropic::Models::Beta::BetaToolBash20250124,
              Anthropic::Models::Beta::BetaToolTextEditor20250124
            )
            ],
            top_k: Integer,
            top_p: Float,
            betas: T::Array[T.any(String, Symbol)],
            request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Anthropic::Models::Beta::BetaMessage)
        end
        def create(
          max_tokens:,
          messages:,
          model:,
          metadata: nil,
          stop_sequences: nil,
          system_: nil,
          temperature: nil,
          thinking: nil,
          tool_choice: nil,
          tools: nil,
          top_k: nil,
          top_p: nil,
          betas: nil,
          request_options: {}
        )
        end

        # Send a structured list of input messages with text and/or image content, and the
        #   model will generate the next message in the conversation.
        #
        #   The Messages API can be used for either single queries or stateless multi-turn
        #   conversations.
        #
        #   Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
        sig do
          params(
            max_tokens: Integer,
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: T.any(Symbol, String),
            metadata: Anthropic::Models::Beta::BetaMetadata,
            stop_sequences: T::Array[String],
            system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
            temperature: Float,
            thinking: T.any(
              Anthropic::Models::Beta::BetaThinkingConfigEnabled,
              Anthropic::Models::Beta::BetaThinkingConfigDisabled
            ),
            tool_choice: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool,
              Anthropic::Models::Beta::BetaToolChoiceNone
            ),
            tools: T::Array[
            T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022,
              Anthropic::Models::Beta::BetaToolComputerUse20250124,
              Anthropic::Models::Beta::BetaToolBash20250124,
              Anthropic::Models::Beta::BetaToolTextEditor20250124
            )
            ],
            top_k: Integer,
            top_p: Float,
            betas: T::Array[T.any(String, Symbol)],
            request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(
              Anthropic::Stream[
              T.any(
                Anthropic::Models::Beta::BetaRawMessageStartEvent,
                Anthropic::Models::Beta::BetaRawMessageDeltaEvent,
                Anthropic::Models::Beta::BetaRawMessageStopEvent,
                Anthropic::Models::Beta::BetaRawContentBlockStartEvent,
                Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent,
                Anthropic::Models::Beta::BetaRawContentBlockStopEvent
              )
              ]
            )
        end
        def create_streaming(
          max_tokens:,
          messages:,
          model:,
          metadata: nil,
          stop_sequences: nil,
          system_: nil,
          temperature: nil,
          thinking: nil,
          tool_choice: nil,
          tools: nil,
          top_k: nil,
          top_p: nil,
          betas: nil,
          request_options: {}
        )
        end

        # Count the number of tokens in a Message.
        #
        #   The Token Count API can be used to count the number of tokens in a Message,
        #   including tools, images, and documents, without creating it.
        #
        #   Learn more about token counting in our
        #   [user guide](/en/docs/build-with-claude/token-counting)
        sig do
          params(
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: T.any(Symbol, String),
            system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
            thinking: T.any(
              Anthropic::Models::Beta::BetaThinkingConfigEnabled,
              Anthropic::Models::Beta::BetaThinkingConfigDisabled
            ),
            tool_choice: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool,
              Anthropic::Models::Beta::BetaToolChoiceNone
            ),
            tools: T::Array[
            T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022,
              Anthropic::Models::Beta::BetaToolComputerUse20250124,
              Anthropic::Models::Beta::BetaToolBash20250124,
              Anthropic::Models::Beta::BetaToolTextEditor20250124
            )
            ],
            betas: T::Array[T.any(String, Symbol)],
            request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Anthropic::Models::Beta::BetaMessageTokensCount)
        end
        def count_tokens(
          messages:,
          model:,
          system_: nil,
          thinking: nil,
          tool_choice: nil,
          tools: nil,
          betas: nil,
          request_options: {}
        )
        end

        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
