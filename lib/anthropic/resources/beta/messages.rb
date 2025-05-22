# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Messages
        # @return [Anthropic::Resources::Beta::Messages::Batches]
        attr_reader :batches

        # See {Anthropic::Resources::Beta::Messages#stream_raw} for streaming counterpart.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::MessageCreateParams} for more details.
        #
        # Send a structured list of input messages with text and/or image content, and the
        # model will generate the next message in the conversation.
        #
        # The Messages API can be used for either single queries or stateless multi-turn
        # conversations.
        #
        # Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
        #
        # @overload create(max_tokens:, messages:, model:, container: nil, mcp_servers: nil, metadata: nil, service_tier: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, betas: nil, request_options: {})
        #
        # @param max_tokens [Integer] Body param: The maximum number of tokens to generate before stopping.
        #
        # @param messages [Array<Anthropic::Models::Beta::BetaMessageParam>] Body param: Input messages.
        #
        # @param model [Symbol, String, Anthropic::Models::Model] Body param: The model that will complete your prompt.\n\nSee [models](https://do
        #
        # @param container [String, nil] Body param: Container identifier for reuse across requests.
        #
        # @param mcp_servers [Array<Anthropic::Models::Beta::BetaRequestMCPServerURLDefinition>] Body param: MCP servers to be utilized in this request
        #
        # @param metadata [Anthropic::Models::Beta::BetaMetadata] Body param: An object describing metadata about the request.
        #
        # @param service_tier [Symbol, Anthropic::Models::Beta::MessageCreateParams::ServiceTier] Body param: Determines whether to use priority capacity (if available) or standa
        #
        # @param stop_sequences [Array<String>] Body param: Custom text sequences that will cause the model to stop generating.
        #
        # @param system_ [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>] Body param: System prompt.
        #
        # @param temperature [Float] Body param: Amount of randomness injected into the response.
        #
        # @param thinking [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled] Body param: Configuration for enabling Claude's extended thinking.
        #
        # @param tool_choice [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
        #
        # @param tools [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124, Anthropic::Models::Beta::BetaToolTextEditor20250429, Anthropic::Models::Beta::BetaWebSearchTool20250305, Anthropic::Models::Beta::BetaCodeExecutionTool20250522>] Body param: Definitions of tools that the model may use.
        #
        # @param top_k [Integer] Body param: Only sample from the top K options for each subsequent token.
        #
        # @param top_p [Float] Body param: Use nucleus sampling.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaMessage]
        #
        # @see Anthropic::Models::Beta::MessageCreateParams
        def create(params)
          parsed, options = Anthropic::Beta::MessageCreateParams.dump_request(params)
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

          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/messages?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaMessage,
            options: options
          )
        end

        def stream
          raise NotImplementedError.new("higher level helpers are coming soon!")
        end

        # See {Anthropic::Resources::Beta::Messages#create} for non-streaming counterpart.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::MessageCreateParams} for more details.
        #
        # Send a structured list of input messages with text and/or image content, and the
        # model will generate the next message in the conversation.
        #
        # The Messages API can be used for either single queries or stateless multi-turn
        # conversations.
        #
        # Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
        #
        # @overload stream_raw(max_tokens:, messages:, model:, container: nil, mcp_servers: nil, metadata: nil, service_tier: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, betas: nil, request_options: {})
        #
        # @param max_tokens [Integer] Body param: The maximum number of tokens to generate before stopping.
        #
        # @param messages [Array<Anthropic::Models::Beta::BetaMessageParam>] Body param: Input messages.
        #
        # @param model [Symbol, String, Anthropic::Models::Model] Body param: The model that will complete your prompt.\n\nSee [models](https://do
        #
        # @param container [String, nil] Body param: Container identifier for reuse across requests.
        #
        # @param mcp_servers [Array<Anthropic::Models::Beta::BetaRequestMCPServerURLDefinition>] Body param: MCP servers to be utilized in this request
        #
        # @param metadata [Anthropic::Models::Beta::BetaMetadata] Body param: An object describing metadata about the request.
        #
        # @param service_tier [Symbol, Anthropic::Models::Beta::MessageCreateParams::ServiceTier] Body param: Determines whether to use priority capacity (if available) or standa
        #
        # @param stop_sequences [Array<String>] Body param: Custom text sequences that will cause the model to stop generating.
        #
        # @param system_ [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>] Body param: System prompt.
        #
        # @param temperature [Float] Body param: Amount of randomness injected into the response.
        #
        # @param thinking [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled] Body param: Configuration for enabling Claude's extended thinking.
        #
        # @param tool_choice [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
        #
        # @param tools [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124, Anthropic::Models::Beta::BetaToolTextEditor20250429, Anthropic::Models::Beta::BetaWebSearchTool20250305, Anthropic::Models::Beta::BetaCodeExecutionTool20250522>] Body param: Definitions of tools that the model may use.
        #
        # @param top_k [Integer] Body param: Only sample from the top K options for each subsequent token.
        #
        # @param top_p [Float] Body param: Use nucleus sampling.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::Stream<Anthropic::Models::Beta::BetaRawMessageStartEvent, Anthropic::Models::Beta::BetaRawMessageDeltaEvent, Anthropic::Models::Beta::BetaRawMessageStopEvent, Anthropic::Models::Beta::BetaRawContentBlockStartEvent, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent, Anthropic::Models::Beta::BetaRawContentBlockStopEvent>]
        #
        # @see Anthropic::Models::Beta::MessageCreateParams
        def stream_raw(params)
          parsed, options = Anthropic::Beta::MessageCreateParams.dump_request(params)
          unless parsed.fetch(:stream, true)
            message = "Please use `#create` for the non-streaming use case."
            raise ArgumentError.new(message)
          end
          parsed.store(:stream, true)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/messages?beta=true",
            headers: {
              "accept" => "text/event-stream",
              **parsed.slice(*header_params.keys)
            }.transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            stream: Anthropic::Internal::Stream,
            model: Anthropic::Beta::BetaRawMessageStreamEvent,
            options: {timeout: 600, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::MessageCountTokensParams} for more details.
        #
        # Count the number of tokens in a Message.
        #
        # The Token Count API can be used to count the number of tokens in a Message,
        # including tools, images, and documents, without creating it.
        #
        # Learn more about token counting in our
        # [user guide](/en/docs/build-with-claude/token-counting)
        #
        # @overload count_tokens(messages:, model:, mcp_servers: nil, system_: nil, thinking: nil, tool_choice: nil, tools: nil, betas: nil, request_options: {})
        #
        # @param messages [Array<Anthropic::Models::Beta::BetaMessageParam>] Body param: Input messages.
        #
        # @param model [Symbol, String, Anthropic::Models::Model] Body param: The model that will complete your prompt.\n\nSee [models](https://do
        #
        # @param mcp_servers [Array<Anthropic::Models::Beta::BetaRequestMCPServerURLDefinition>] Body param: MCP servers to be utilized in this request
        #
        # @param system_ [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>] Body param: System prompt.
        #
        # @param thinking [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled] Body param: Configuration for enabling Claude's extended thinking.
        #
        # @param tool_choice [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
        #
        # @param tools [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124, Anthropic::Models::Beta::BetaToolTextEditor20250429, Anthropic::Models::Beta::BetaWebSearchTool20250305, Anthropic::Models::Beta::BetaCodeExecutionTool20250522>] Body param: Definitions of tools that the model may use.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaMessageTokensCount]
        #
        # @see Anthropic::Models::Beta::MessageCountTokensParams
        def count_tokens(params)
          parsed, options = Anthropic::Beta::MessageCountTokensParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/messages/count_tokens?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaMessageTokensCount,
            options: options
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @batches = Anthropic::Resources::Beta::Messages::Batches.new(client: client)
        end
      end
    end
  end
end
