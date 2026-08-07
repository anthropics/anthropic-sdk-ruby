# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDiagnostics < Anthropic::Internal::Type::BaseModel
        # @!attribute cache_miss_reason
        #   Explains why the prompt cache could not fully reuse the prefix from the request
        #   identified by `diagnostics.previous_message_id`. `null` means diagnosis is still
        #   pending — the response was serialized before the background comparison
        #   completed.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheMissModelChanged, Anthropic::Models::Beta::BetaCacheMissSystemChanged, Anthropic::Models::Beta::BetaCacheMissToolsChanged, Anthropic::Models::Beta::BetaCacheMissMessagesChanged, Anthropic::Models::Beta::BetaCacheMissPreviousMessageNotFound, Anthropic::Models::Beta::BetaCacheMissUnavailable, nil]
        required :cache_miss_reason,
                 union: -> {
                   Anthropic::Beta::BetaDiagnostics::CacheMissReason
                 },
                 nil?: true

        # @!method initialize(cache_miss_reason:)
        #   Response envelope for request-level diagnostics. Present (possibly null)
        #   whenever the caller supplied `diagnostics` on the request.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDiagnostics} for more details.
        #
        #   @param cache_miss_reason [Anthropic::Models::Beta::BetaCacheMissModelChanged, Anthropic::Models::Beta::BetaCacheMissSystemChanged, Anthropic::Models::Beta::BetaCacheMissToolsChanged, Anthropic::Models::Beta::BetaCacheMissMessagesChanged, Anthropic::Models::Beta::BetaCacheMissPreviousMessageNotFound, Anthropic::Models::Beta::BetaCacheMissUnavailable, nil] Explains why the prompt cache could not fully reuse the prefix from the request

        # Explains why the prompt cache could not fully reuse the prefix from the request
        # identified by `diagnostics.previous_message_id`. `null` means diagnosis is still
        # pending — the response was serialized before the background comparison
        # completed.
        #
        # @see Anthropic::Models::Beta::BetaDiagnostics#cache_miss_reason
        module CacheMissReason
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :model_changed, -> { Anthropic::Beta::BetaCacheMissModelChanged }

          variant :system_changed, -> { Anthropic::Beta::BetaCacheMissSystemChanged }

          variant :tools_changed, -> { Anthropic::Beta::BetaCacheMissToolsChanged }

          variant :messages_changed, -> { Anthropic::Beta::BetaCacheMissMessagesChanged }

          variant :previous_message_not_found, -> { Anthropic::Beta::BetaCacheMissPreviousMessageNotFound }

          variant :unavailable, -> { Anthropic::Beta::BetaCacheMissUnavailable }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaCacheMissModelChanged, Anthropic::Models::Beta::BetaCacheMissSystemChanged, Anthropic::Models::Beta::BetaCacheMissToolsChanged, Anthropic::Models::Beta::BetaCacheMissMessagesChanged, Anthropic::Models::Beta::BetaCacheMissPreviousMessageNotFound, Anthropic::Models::Beta::BetaCacheMissUnavailable)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::BetaDiagnostics::CacheMissReason} for more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Integer] :cache_missed_input_tokens Approximate number of input tokens that would have been read from cache had the
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaCacheMissModelChanged, Anthropic::Models::Beta::BetaCacheMissSystemChanged, Anthropic::Models::Beta::BetaCacheMissToolsChanged, Anthropic::Models::Beta::BetaCacheMissMessagesChanged, Anthropic::Models::Beta::BetaCacheMissPreviousMessageNotFound, Anthropic::Models::Beta::BetaCacheMissUnavailable]
          def self.new(type:, **args)
            case type.to_sym
            when :model_changed
              Anthropic::Beta::BetaCacheMissModelChanged.new(**args)
            when :system_changed
              Anthropic::Beta::BetaCacheMissSystemChanged.new(**args)
            when :tools_changed
              Anthropic::Beta::BetaCacheMissToolsChanged.new(**args)
            when :messages_changed
              Anthropic::Beta::BetaCacheMissMessagesChanged.new(**args)
            when :previous_message_not_found
              Anthropic::Beta::BetaCacheMissPreviousMessageNotFound.new(**args)
            when :unavailable
              Anthropic::Beta::BetaCacheMissUnavailable.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaDiagnostics = Beta::BetaDiagnostics
  end
end
