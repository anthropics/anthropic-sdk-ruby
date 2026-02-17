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
      # Learn more about the Messages API in our
      # [user guide](https://docs.claude.com/en/docs/initial-setup)
      #
      # @overload create(max_tokens:, messages:, model:, container: nil, inference_geo: nil, metadata: nil, output_config: nil, service_tier: nil, speed: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, request_options: {})
      #
      # @param max_tokens [Integer] The maximum number of tokens to generate before stopping.
      #
      # @param messages [Array<Anthropic::Models::MessageParam>] Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
      #
      # @param container [String, nil] Container identifier for reuse across requests.
      #
      # @param inference_geo [String, nil] Specifies the geographic region for inference processing. If not specified, the
      #
      # @param metadata [Anthropic::Models::Metadata] An object describing metadata about the request.
      #
      # @param output_config [Anthropic::Models::OutputConfig] Configuration options for the model's output, such as the output format.
      #
      # @param service_tier [Symbol, Anthropic::Models::MessageCreateParams::ServiceTier] Determines whether to use priority capacity (if available) or standard capacity
      #
      # @param speed [Symbol, Anthropic::Models::MessageCreateParams::Speed, nil] The inference speed mode for this request. `"fast"` enables high output-tokens-p
      #
      # @param stop_sequences [Array<String>] Custom text sequences that will cause the model to stop generating.
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] System prompt.
      #
      # @param temperature [Float] Amount of randomness injected into the response.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigAdaptive] Configuration for enabling Claude's extended thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] How the model should use the provided tools. The model can use a specific tool,
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::ToolUnion::CodeExecutionTool20260120, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::ToolUnion::WebSearchTool20260209, Anthropic::Models::ToolUnion::WebFetchTool20260209, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119>] Definitions of tools that the model may use.
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
        @client.request(
          method: :post,
          path: "v1/messages",
          body: parsed,
          model: Anthropic::Message,
          options: {timeout: 600, **options}
        )
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
      # Learn more about the Messages API in our
      # [user guide](https://docs.claude.com/en/docs/initial-setup)
      #
      # @overload stream_raw(max_tokens:, messages:, model:, container: nil, inference_geo: nil, metadata: nil, output_config: nil, service_tier: nil, speed: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, request_options: {})
      #
      # @param max_tokens [Integer] The maximum number of tokens to generate before stopping.
      #
      # @param messages [Array<Anthropic::Models::MessageParam>] Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
      #
      # @param container [String, nil] Container identifier for reuse across requests.
      #
      # @param inference_geo [String, nil] Specifies the geographic region for inference processing. If not specified, the
      #
      # @param metadata [Anthropic::Models::Metadata] An object describing metadata about the request.
      #
      # @param output_config [Anthropic::Models::OutputConfig] Configuration options for the model's output, such as the output format.
      #
      # @param service_tier [Symbol, Anthropic::Models::MessageCreateParams::ServiceTier] Determines whether to use priority capacity (if available) or standard capacity
      #
      # @param speed [Symbol, Anthropic::Models::MessageCreateParams::Speed, nil] The inference speed mode for this request. `"fast"` enables high output-tokens-p
      #
      # @param stop_sequences [Array<String>] Custom text sequences that will cause the model to stop generating.
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] System prompt.
      #
      # @param temperature [Float] Amount of randomness injected into the response.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigAdaptive] Configuration for enabling Claude's extended thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] How the model should use the provided tools. The model can use a specific tool,
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::ToolUnion::CodeExecutionTool20260120, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::ToolUnion::WebSearchTool20260209, Anthropic::Models::ToolUnion::WebFetchTool20260209, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119>] Definitions of tools that the model may use.
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
      # [user guide](https://docs.claude.com/en/docs/build-with-claude/token-counting)
      #
      # @overload count_tokens(messages:, model:, output_config: nil, speed: nil, system_: nil, thinking: nil, tool_choice: nil, tools: nil, request_options: {})
      #
      # @param messages [Array<Anthropic::Models::MessageParam>] Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
      #
      # @param output_config [Anthropic::Models::OutputConfig] Configuration options for the model's output, such as the output format.
      #
      # @param speed [Symbol, Anthropic::Models::MessageCountTokensParams::Speed, nil] The inference speed mode for this request. `"fast"` enables high output-tokens-p
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] System prompt.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigAdaptive] Configuration for enabling Claude's extended thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] How the model should use the provided tools. The model can use a specific tool,
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::MessageCountTokensTool::CodeExecutionTool20260120, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::MessageCountTokensTool::WebSearchTool20260209, Anthropic::Models::MessageCountTokensTool::WebFetchTool20260209, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119>] Definitions of tools that the model may use.
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
