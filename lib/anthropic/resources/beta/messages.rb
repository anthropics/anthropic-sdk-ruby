# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Messages
        # @return [Anthropic::Resources::Beta::Messages::Batches]
        attr_reader :batches

        # See {Anthropic::Resources::Beta::Messages#stream_raw} for streaming counterpart.
        #
        #   Send a structured list of input messages with text and/or image content, and the
        #   model will generate the next message in the conversation.
        #
        #   The Messages API can be used for either single queries or stateless multi-turn
        #   conversations.
        #
        #   Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
        #
        # @overload create(max_tokens:, messages:, model:, metadata: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, betas: nil, request_options: {})
        #
        # @param max_tokens [Integer]
        # @param messages [Array<Anthropic::Models::Beta::BetaMessageParam>]
        # @param model [Symbol, String, Anthropic::Models::Model]
        # @param metadata [Anthropic::Models::Beta::BetaMetadata]
        # @param stop_sequences [Array<String>]
        # @param system_ [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>]
        # @param temperature [Float]
        # @param thinking [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled]
        # @param tool_choice [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone]
        # @param tools [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124>]
        # @param top_k [Integer]
        # @param top_p [Float]
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>]
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaMessage]
        #
        # @see Anthropic::Models::Beta::MessageCreateParams
        def create(params)
          parsed, options = Anthropic::Models::Beta::MessageCreateParams.dump_request(params)
          if parsed[:stream]
            message = "Please use `#stream_raw` for the streaming use case."
            raise ArgumentError.new(message)
          end
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/messages?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys).transform_keys(system_: :system),
            model: Anthropic::Models::Beta::BetaMessage,
            options: options
          )
        end

        # See {Anthropic::Resources::Beta::Messages#create} for non-streaming counterpart.
        #
        #   Send a structured list of input messages with text and/or image content, and the
        #   model will generate the next message in the conversation.
        #
        #   The Messages API can be used for either single queries or stateless multi-turn
        #   conversations.
        #
        #   Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
        #
        # @overload stream_raw(max_tokens:, messages:, model:, metadata: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, betas: nil, request_options: {})
        #
        # @param max_tokens [Integer]
        # @param messages [Array<Anthropic::Models::Beta::BetaMessageParam>]
        # @param model [Symbol, String, Anthropic::Models::Model]
        # @param metadata [Anthropic::Models::Beta::BetaMetadata]
        # @param stop_sequences [Array<String>]
        # @param system_ [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>]
        # @param temperature [Float]
        # @param thinking [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled]
        # @param tool_choice [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone]
        # @param tools [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124>]
        # @param top_k [Integer]
        # @param top_p [Float]
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>]
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::Stream<Anthropic::Models::Beta::BetaRawMessageStartEvent, Anthropic::Models::Beta::BetaRawMessageDeltaEvent, Anthropic::Models::Beta::BetaRawMessageStopEvent, Anthropic::Models::Beta::BetaRawContentBlockStartEvent, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent, Anthropic::Models::Beta::BetaRawContentBlockStopEvent>]
        #
        # @see Anthropic::Models::Beta::MessageCreateParams
        def stream_raw(params)
          parsed, options = Anthropic::Models::Beta::MessageCreateParams.dump_request(params)
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
            body: parsed.except(*header_params.keys).transform_keys(system_: :system),
            stream: Anthropic::Internal::Stream,
            model: Anthropic::Models::Beta::BetaRawMessageStreamEvent,
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
        # @overload count_tokens(messages:, model:, system_: nil, thinking: nil, tool_choice: nil, tools: nil, betas: nil, request_options: {})
        #
        # @param messages [Array<Anthropic::Models::Beta::BetaMessageParam>]
        # @param model [Symbol, String, Anthropic::Models::Model]
        # @param system_ [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>]
        # @param thinking [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled]
        # @param tool_choice [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone]
        # @param tools [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124>]
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>]
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaMessageTokensCount]
        #
        # @see Anthropic::Models::Beta::MessageCountTokensParams
        def count_tokens(params)
          parsed, options = Anthropic::Models::Beta::MessageCountTokensParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/messages/count_tokens?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys).transform_keys(system_: :system),
            model: Anthropic::Models::Beta::BetaMessageTokensCount,
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
