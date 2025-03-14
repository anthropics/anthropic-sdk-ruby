# typed: strong

module Anthropic
  module Resources
    class Messages
      sig { returns(Anthropic::Resources::Messages::Batches) }
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
          messages: T::Array[Anthropic::Models::MessageParam],
          model: T.any(Symbol, String),
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
          temperature: Float,
          thinking: T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled),
          tool_choice: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool,
            Anthropic::Models::ToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Anthropic::Models::Tool,
            Anthropic::Models::ToolBash20250124,
            Anthropic::Models::ToolTextEditor20250124
          )
          ],
          top_k: Integer,
          top_p: Float,
          request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Anthropic::Models::Message)
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
          messages: T::Array[Anthropic::Models::MessageParam],
          model: T.any(Symbol, String),
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
          temperature: Float,
          thinking: T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled),
          tool_choice: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool,
            Anthropic::Models::ToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Anthropic::Models::Tool,
            Anthropic::Models::ToolBash20250124,
            Anthropic::Models::ToolTextEditor20250124
          )
          ],
          top_k: Integer,
          top_p: Float,
          request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(
            Anthropic::Stream[
            T.any(
              Anthropic::Models::RawMessageStartEvent,
              Anthropic::Models::RawMessageDeltaEvent,
              Anthropic::Models::RawMessageStopEvent,
              Anthropic::Models::RawContentBlockStartEvent,
              Anthropic::Models::RawContentBlockDeltaEvent,
              Anthropic::Models::RawContentBlockStopEvent
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
          messages: T::Array[Anthropic::Models::MessageParam],
          model: T.any(Symbol, String),
          system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
          thinking: T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled),
          tool_choice: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool,
            Anthropic::Models::ToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Anthropic::Models::Tool,
            Anthropic::Models::ToolBash20250124,
            Anthropic::Models::ToolTextEditor20250124
          )
          ],
          request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Anthropic::Models::MessageTokensCount)
      end
      def count_tokens(
        messages:,
        model:,
        system_: nil,
        thinking: nil,
        tool_choice: nil,
        tools: nil,
        request_options: {}
      )
      end

      sig { params(client: Anthropic::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
