# frozen_string_literal: true

module Anthropic
  module Resources
    class Messages
      # @return [Anthropic::Resources::Messages::Batches]
      attr_reader :batches

      # See {Anthropic::Resources::Messages#stream_raw} for streaming counterpart.
      #
      #   Send a structured list of input messages with text and/or image content, and the
      #   model will generate the next message in the conversation.
      #
      #   The Messages API can be used for either single queries or stateless multi-turn
      #   conversations.
      #
      #   Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
      #
      # @overload create(max_tokens:, messages:, model:, metadata: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, request_options: {})
      #
      # @param max_tokens [Integer]
      # @param messages [Array<Anthropic::Models::MessageParam>]
      # @param model [Symbol, String, Anthropic::Models::Model]
      # @param metadata [Anthropic::Models::Metadata]
      # @param stop_sequences [Array<String>]
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>]
      # @param temperature [Float]
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled]
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone]
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::ToolTextEditor20250124>]
      # @param top_k [Integer]
      # @param top_p [Float]
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::Message]
      #
      # @see Anthropic::Models::MessageCreateParams
      def create(params)
        parsed, options = Anthropic::Models::MessageCreateParams.dump_request(params)
        if parsed[:stream]
          message = "Please use `#stream_raw` for the streaming use case."
          raise ArgumentError.new(message)
        end
        @client.request(
          method: :post,
          path: "v1/messages",
          body: parsed,
          model: Anthropic::Models::Message,
          options: options
        )
      end

      def stream
        raise NotImplementedError.new("higher level helpers are coming soon!")
      end

      # See {Anthropic::Resources::Messages#create} for non-streaming counterpart.
      #
      #   Send a structured list of input messages with text and/or image content, and the
      #   model will generate the next message in the conversation.
      #
      #   The Messages API can be used for either single queries or stateless multi-turn
      #   conversations.
      #
      #   Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
      #
      # @overload stream_raw(max_tokens:, messages:, model:, metadata: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, request_options: {})
      #
      # @param max_tokens [Integer]
      # @param messages [Array<Anthropic::Models::MessageParam>]
      # @param model [Symbol, String, Anthropic::Models::Model]
      # @param metadata [Anthropic::Models::Metadata]
      # @param stop_sequences [Array<String>]
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>]
      # @param temperature [Float]
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled]
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone]
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::ToolTextEditor20250124>]
      # @param top_k [Integer]
      # @param top_p [Float]
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Internal::Stream<Anthropic::Models::RawMessageStartEvent, Anthropic::Models::RawMessageDeltaEvent, Anthropic::Models::RawMessageStopEvent, Anthropic::Models::RawContentBlockStartEvent, Anthropic::Models::RawContentBlockDeltaEvent, Anthropic::Models::RawContentBlockStopEvent>]
      #
      # @see Anthropic::Models::MessageCreateParams
      def stream_raw(params)
        parsed, options = Anthropic::Models::MessageCreateParams.dump_request(params)
        unless parsed.fetch(:stream, true)
          message = "Please use `#create` for the non-streaming use case."
          raise ArgumentError.new(message)
        end
        parsed.store(:stream, true)
        @client.request(
          method: :post,
          path: "v1/messages",
          headers: {"accept" => "text/event-stream"},
          body: parsed,
          stream: Anthropic::Internal::Stream,
          model: Anthropic::Models::RawMessageStreamEvent,
          options: options
        )
      end

      # Count the number of tokens in a Message.
      #
      #   The Token Count API can be used to count the number of tokens in a Message,
      #   including tools, images, and documents, without creating it.
      #
      #   Learn more about token counting in our
      #   [user guide](/en/docs/build-with-claude/token-counting)
      #
      # @overload count_tokens(messages:, model:, system_: nil, thinking: nil, tool_choice: nil, tools: nil, request_options: {})
      #
      # @param messages [Array<Anthropic::Models::MessageParam>]
      # @param model [Symbol, String, Anthropic::Models::Model]
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>]
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled]
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone]
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::ToolTextEditor20250124>]
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::MessageTokensCount]
      #
      # @see Anthropic::Models::MessageCountTokensParams
      def count_tokens(params)
        parsed, options = Anthropic::Models::MessageCountTokensParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/messages/count_tokens",
          body: parsed,
          model: Anthropic::Models::MessageTokensCount,
          options: options
        )
      end

      # @api private
      #
      # @param client [Anthropic::Client]
      def initialize(client:)
        @client = client
        @batches = Anthropic::Resources::Messages::Batches.new(client: client)
      end
    end
  end
end
