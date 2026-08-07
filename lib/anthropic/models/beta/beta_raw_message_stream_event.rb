# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaRawMessageStreamEvent
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :message_start, -> { Anthropic::Beta::BetaRawMessageStartEvent }

        variant :message_delta, -> { Anthropic::Beta::BetaRawMessageDeltaEvent }

        variant :message_stop, -> { Anthropic::Beta::BetaRawMessageStopEvent }

        variant :content_block_start, -> { Anthropic::Beta::BetaRawContentBlockStartEvent }

        variant :content_block_delta, -> { Anthropic::Beta::BetaRawContentBlockDeltaEvent }

        variant :content_block_stop, -> { Anthropic::Beta::BetaRawContentBlockStopEvent }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaRawMessageStartEvent, Anthropic::Models::Beta::BetaRawMessageDeltaEvent, Anthropic::Models::Beta::BetaRawMessageStopEvent, Anthropic::Models::Beta::BetaRawContentBlockStartEvent, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent, Anthropic::Models::Beta::BetaRawContentBlockStopEvent)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaRawMessageStreamEvent} for more details.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Anthropic::Models::Beta::BetaMessage] :message
        #
        #   @option args [Anthropic::Models::Beta::BetaContextManagementResponse, nil] :context_management Information about context management strategies applied during the request
        #
        #   @option args [Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta, Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaCitationsDelta, Anthropic::Models::Beta::BetaThinkingDelta, Anthropic::Models::Beta::BetaSignatureDelta, Anthropic::Models::Beta::BetaCompactionContentBlockDelta] :delta
        #
        #   @option args [Anthropic::Models::Beta::BetaMessageDeltaUsage] :usage Billing and rate-limit usage.
        #
        #   @option args [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaServerToolUseBlock, Anthropic::Models::Beta::BetaWebSearchToolResultBlock, Anthropic::Models::Beta::BetaWebFetchToolResultBlock, Anthropic::Models::Beta::BetaAdvisorToolResultBlock, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaToolSearchToolResultBlock, Anthropic::Models::Beta::BetaMCPToolUseBlock, Anthropic::Models::Beta::BetaMCPToolResultBlock, Anthropic::Models::Beta::BetaContainerUploadBlock, Anthropic::Models::Beta::BetaCompactionBlock, Anthropic::Models::Beta::BetaFallbackBlock] :content_block Response model for a file uploaded to the container.
        #
        #   @option args [Integer] :index
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaRawMessageStartEvent, Anthropic::Models::Beta::BetaRawMessageDeltaEvent, Anthropic::Models::Beta::BetaRawMessageStopEvent, Anthropic::Models::Beta::BetaRawContentBlockStartEvent, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent, Anthropic::Models::Beta::BetaRawContentBlockStopEvent]
        def self.new(type:, **args)
          case type.to_sym
          when :message_start
            Anthropic::Beta::BetaRawMessageStartEvent.new(**args)
          when :message_delta
            Anthropic::Beta::BetaRawMessageDeltaEvent.new(**args)
          when :message_stop
            Anthropic::Beta::BetaRawMessageStopEvent.new(**args)
          when :content_block_start
            Anthropic::Beta::BetaRawContentBlockStartEvent.new(**args)
          when :content_block_delta
            Anthropic::Beta::BetaRawContentBlockDeltaEvent.new(**args)
          when :content_block_stop
            Anthropic::Beta::BetaRawContentBlockStopEvent.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaRawMessageStreamEvent = Beta::BetaRawMessageStreamEvent
  end
end
