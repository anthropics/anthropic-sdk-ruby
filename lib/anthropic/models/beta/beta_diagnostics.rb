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
        required :cache_miss_reason, union: -> { Anthropic::Beta::BetaCacheMissReason }, nil?: true

        # @!method initialize(cache_miss_reason:)
        #   Request-level diagnostics: why the prompt cache could not fully reuse the prefix
        #   of the request named by `diagnostics.previous_message_id`.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDiagnostics} for more details.
        #
        #   @param cache_miss_reason [Anthropic::Models::Beta::BetaCacheMissModelChanged, Anthropic::Models::Beta::BetaCacheMissSystemChanged, Anthropic::Models::Beta::BetaCacheMissToolsChanged, Anthropic::Models::Beta::BetaCacheMissMessagesChanged, Anthropic::Models::Beta::BetaCacheMissPreviousMessageNotFound, Anthropic::Models::Beta::BetaCacheMissUnavailable, nil] Explains why the prompt cache could not fully reuse the prefix from the request
      end
    end

    BetaDiagnostics = Beta::BetaDiagnostics
  end
end
