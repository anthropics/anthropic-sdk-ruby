# frozen_string_literal: true

module Anthropic
  module Resources
    class Messages
      # @return [Anthropic::Resources::Messages::Batches]
      attr_reader :batches

      # See {Anthropic::Resources::Messages#stream_raw} for streaming counterpart.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::MessageCreateParams} for more details.
      #
      # Send a structured list of input messages with text and/or image content, and the
      # model will generate the next message in the conversation.
      #
      # The Messages API can be used for either single queries or stateless multi-turn
      # conversations.
      #
      # Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
      #
      # @overload create(max_tokens:, messages:, model:, metadata: nil, service_tier: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, request_options: {})
      #
      # @param max_tokens [Integer] The maximum number of tokens to generate before stopping.
      #
      # @param messages [Array<Anthropic::Models::MessageParam>] Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
      #
      # @param metadata [Anthropic::Models::Metadata] An object describing metadata about the request.
      #
      # @param service_tier [Symbol, Anthropic::Models::MessageCreateParams::ServiceTier] Determines whether to use priority capacity (if available) or standard capacity
      #
      # @param stop_sequences [Array<String>] Custom text sequences that will cause the model to stop generating.
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] System prompt.
      #
      # @param temperature [Float] Amount of randomness injected into the response.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled] Configuration for enabling Claude's extended thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] How the model should use the provided tools. The model can use a specific tool,
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::WebSearchTool20250305>] Definitions of tools that the model may use.
      #
      # @param top_k [Integer] Only sample from the top K options for each subsequent token.
      #
      # @param top_p [Float] Use nucleus sampling.
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::Message]
      #
      # @see Anthropic::Models::MessageCreateParams
      def create(params)
        parsed, options = Anthropic::MessageCreateParams.dump_request(params)
        if parsed[:stream]
          message = "Please use `#stream_raw` for the streaming use case."
          raise ArgumentError.new(message)
        end

        if options.empty? && @client.timeout == Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS
          model = parsed[:model].to_sym
          max_tokens = parsed[:max_tokens].to_i
          timeout = @client.calculate_nonstreaming_timeout(
            max_tokens,
            Anthropic::Client::MODEL_NONSTREAMING_TOKENS[model]
          )
          options = {timeout: timeout}
        else
          options = {timeout: 600, **options}
        end

        @client.request(
          method: :post,
          path: "v1/messages",
          body: parsed,
          model: Anthropic::Message,
          options: options
        )
      end

      def stream
        raise NotImplementedError.new("higher level helpers are coming soon!")
      end

      # See {Anthropic::Resources::Messages#create} for non-streaming counterpart.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::MessageCreateParams} for more details.
      #
      # Send a structured list of input messages with text and/or image content, and the
      # model will generate the next message in the conversation.
      #
      # The Messages API can be used for either single queries or stateless multi-turn
      # conversations.
      #
      # Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
      #
      # @overload stream_raw(max_tokens:, messages:, model:, metadata: nil, service_tier: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, request_options: {})
      #
      # @param max_tokens [Integer] The maximum number of tokens to generate before stopping.
      #
      # @param messages [Array<Anthropic::Models::MessageParam>] Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
      #
      # @param metadata [Anthropic::Models::Metadata] An object describing metadata about the request.
      #
      # @param service_tier [Symbol, Anthropic::Models::MessageCreateParams::ServiceTier] Determines whether to use priority capacity (if available) or standard capacity
      #
      # @param stop_sequences [Array<String>] Custom text sequences that will cause the model to stop generating.
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] System prompt.
      #
      # @param temperature [Float] Amount of randomness injected into the response.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled] Configuration for enabling Claude's extended thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] How the model should use the provided tools. The model can use a specific tool,
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::WebSearchTool20250305>] Definitions of tools that the model may use.
      #
      # @param top_k [Integer] Only sample from the top K options for each subsequent token.
      #
      # @param top_p [Float] Use nucleus sampling.
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Internal::Stream<Anthropic::Models::RawMessageStartEvent, Anthropic::Models::RawMessageDeltaEvent, Anthropic::Models::RawMessageStopEvent, Anthropic::Models::RawContentBlockStartEvent, Anthropic::Models::RawContentBlockDeltaEvent, Anthropic::Models::RawContentBlockStopEvent>]
      #
      # @see Anthropic::Models::MessageCreateParams
      def stream_raw(params)
        parsed, options = Anthropic::MessageCreateParams.dump_request(params)
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
          model: Anthropic::RawMessageStreamEvent,
          options: {timeout: 600, **options}
        )
      end

      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::MessageCountTokensParams} for more details.
      #
      # Count the number of tokens in a Message.
      #
      # The Token Count API can be used to count the number of tokens in a Message,
      # including tools, images, and documents, without creating it.
      #
      # Learn more about token counting in our
      # [user guide](/en/docs/build-with-claude/token-counting)
      #
      # @overload count_tokens(messages:, model:, system_: nil, thinking: nil, tool_choice: nil, tools: nil, request_options: {})
      #
      # @param messages [Array<Anthropic::Models::MessageParam>] Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] System prompt.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled] Configuration for enabling Claude's extended thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] How the model should use the provided tools. The model can use a specific tool,
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::WebSearchTool20250305>] Definitions of tools that the model may use.
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::MessageTokensCount]
      #
      # @see Anthropic::Models::MessageCountTokensParams
      def count_tokens(params)
        parsed, options = Anthropic::MessageCountTokensParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/messages/count_tokens",
          body: parsed,
          model: Anthropic::MessageTokensCount,
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
