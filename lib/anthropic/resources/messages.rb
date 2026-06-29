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
      # [user guide](https://platform.claude.com/docs/en/get-started)
      #
      # @overload create(max_tokens:, messages:, model:, cache_control: nil, container: nil, inference_geo: nil, metadata: nil, output_config: nil, service_tier: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, user_profile_id: nil, request_options: {})
      #
      # @param max_tokens [Integer] Body param: The maximum number of tokens to generate before stopping.
      #
      # @param messages [Array<Anthropic::Models::MessageParam>] Body param: Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] Body param: The model that will complete your prompt.
      #
      # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Body param: Top-level cache control automatically applies a cache_control marker
      #
      # @param container [String, nil] Body param: Container identifier for reuse across requests.
      #
      # @param inference_geo [String, nil] Body param: Specifies the geographic region for inference processing. If not spe
      #
      # @param metadata [Anthropic::Models::Metadata] Body param: An object describing metadata about the request.
      #
      # @param output_config [Anthropic::Models::OutputConfig] Body param: Configuration options for the model's output, such as the output for
      #
      # @param service_tier [Symbol, Anthropic::Models::MessageCreateParams::ServiceTier] Body param: Determines whether to use priority capacity (if available) or standa
      #
      # @param stop_sequences [Array<String>] Body param: Custom text sequences that will cause the model to stop generating.
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] Body param: System prompt.
      #
      # @param temperature [Float] Body param: Amount of randomness injected into the response.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigAdaptive] Body param: Configuration for enabling Claude's extended thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::CodeExecutionTool20260120, Anthropic::Models::CodeExecutionTool20260521, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::WebSearchTool20260209, Anthropic::Models::WebFetchTool20260209, Anthropic::Models::WebFetchTool20260309, Anthropic::Models::WebSearchTool20260318, Anthropic::Models::WebFetchTool20260318, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119>] Body param: Definitions of tools that the model may use.
      #
      # @param top_k [Integer] Body param: Only sample from the top K options for each subsequent token.
      #
      # @param top_p [Float] Body param: Use nucleus sampling.
      #
      # @param user_profile_id [String] Header param: The user profile ID to attribute this request to. Use when acting
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
        header_params = {user_profile_id: "anthropic-user-profile-id"}
        @client.request(
          method: :post,
          path: "v1/messages",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
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
      # [user guide](https://platform.claude.com/docs/en/get-started)
      #
      # @overload stream_raw(max_tokens:, messages:, model:, cache_control: nil, container: nil, inference_geo: nil, metadata: nil, output_config: nil, service_tier: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, user_profile_id: nil, request_options: {})
      #
      # @param max_tokens [Integer] Body param: The maximum number of tokens to generate before stopping.
      #
      # @param messages [Array<Anthropic::Models::MessageParam>] Body param: Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] Body param: The model that will complete your prompt.
      #
      # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Body param: Top-level cache control automatically applies a cache_control marker
      #
      # @param container [String, nil] Body param: Container identifier for reuse across requests.
      #
      # @param inference_geo [String, nil] Body param: Specifies the geographic region for inference processing. If not spe
      #
      # @param metadata [Anthropic::Models::Metadata] Body param: An object describing metadata about the request.
      #
      # @param output_config [Anthropic::Models::OutputConfig] Body param: Configuration options for the model's output, such as the output for
      #
      # @param service_tier [Symbol, Anthropic::Models::MessageCreateParams::ServiceTier] Body param: Determines whether to use priority capacity (if available) or standa
      #
      # @param stop_sequences [Array<String>] Body param: Custom text sequences that will cause the model to stop generating.
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] Body param: System prompt.
      #
      # @param temperature [Float] Body param: Amount of randomness injected into the response.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigAdaptive] Body param: Configuration for enabling Claude's extended thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::CodeExecutionTool20260120, Anthropic::Models::CodeExecutionTool20260521, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::WebSearchTool20260209, Anthropic::Models::WebFetchTool20260209, Anthropic::Models::WebFetchTool20260309, Anthropic::Models::WebSearchTool20260318, Anthropic::Models::WebFetchTool20260318, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119>] Body param: Definitions of tools that the model may use.
      #
      # @param top_k [Integer] Body param: Only sample from the top K options for each subsequent token.
      #
      # @param top_p [Float] Body param: Use nucleus sampling.
      #
      # @param user_profile_id [String] Header param: The user profile ID to attribute this request to. Use when acting
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
        header_params = {user_profile_id: "anthropic-user-profile-id"}
        @client.request(
          method: :post,
          path: "v1/messages",
          headers: {
            "accept" => "text/event-stream",
            "accept-encoding" => "identity",
            **parsed.slice(*header_params.keys)
          }.transform_keys(
            header_params
          ),
          body: parsed.except(*header_params.keys),
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
      # [user guide](https://platform.claude.com/docs/en/build-with-claude/token-counting)
      #
      # @overload count_tokens(messages:, model:, cache_control: nil, output_config: nil, system_: nil, thinking: nil, tool_choice: nil, tools: nil, user_profile_id: nil, request_options: {})
      #
      # @param messages [Array<Anthropic::Models::MessageParam>] Body param: Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] Body param: The model that will complete your prompt.
      #
      # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Body param: Top-level cache control automatically applies a cache_control marker
      #
      # @param output_config [Anthropic::Models::OutputConfig] Body param: Configuration options for the model's output, such as the output for
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] Body param: System prompt.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigAdaptive] Body param: Configuration for enabling Claude's extended thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::CodeExecutionTool20260120, Anthropic::Models::CodeExecutionTool20260521, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::WebSearchTool20260209, Anthropic::Models::WebFetchTool20260209, Anthropic::Models::WebFetchTool20260309, Anthropic::Models::WebSearchTool20260318, Anthropic::Models::WebFetchTool20260318, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119>] Body param: Definitions of tools that the model may use.
      #
      # @param user_profile_id [String] Header param: The user profile ID to attribute this request to. Use when acting
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::MessageTokensCount]
      #
      # @see Anthropic::Models::MessageCountTokensParams
      def count_tokens(params)
        parsed, options = Anthropic::MessageCountTokensParams.dump_request(params)
        header_params = {user_profile_id: "anthropic-user-profile-id"}
        @client.request(
          method: :post,
          path: "v1/messages/count_tokens",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
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
