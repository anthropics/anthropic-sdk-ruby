# frozen_string_literal: true

module Anthropic
  module Models
    class Diagnostics < Anthropic::Internal::Type::BaseModel
      # @!attribute cache_miss_reason
      #   Explains why the prompt cache could not fully reuse the prefix from the request
      #   identified by `diagnostics.previous_message_id`. `null` means diagnosis is still
      #   pending — the response was serialized before the background comparison
      #   completed.
      #
      #   @return [Anthropic::Models::CacheMissModelChanged, Anthropic::Models::CacheMissSystemChanged, Anthropic::Models::CacheMissToolsChanged, Anthropic::Models::CacheMissMessagesChanged, Anthropic::Models::CacheMissPreviousMessageNotFound, Anthropic::Models::CacheMissUnavailable, nil]
      required :cache_miss_reason, union: -> { Anthropic::CacheMissReason }, nil?: true

      # @!method initialize(cache_miss_reason:)
      #   Request-level diagnostics: why the prompt cache could not fully reuse the prefix
      #   of the request named by `diagnostics.previous_message_id`.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::Diagnostics} for more details.
      #
      #   @param cache_miss_reason [Anthropic::Models::CacheMissModelChanged, Anthropic::Models::CacheMissSystemChanged, Anthropic::Models::CacheMissToolsChanged, Anthropic::Models::CacheMissMessagesChanged, Anthropic::Models::CacheMissPreviousMessageNotFound, Anthropic::Models::CacheMissUnavailable, nil] Explains why the prompt cache could not fully reuse the prefix from the request
    end
  end
end
