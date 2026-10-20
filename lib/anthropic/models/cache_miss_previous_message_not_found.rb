# frozen_string_literal: true

module Anthropic
  module Models
    class CacheMissPreviousMessageNotFound < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :previous_message_not_found]
      required :type, const: :previous_message_not_found

      # @!method initialize(type: :previous_message_not_found)
      #   A `cache_miss_reason` for when the API doesn't have a stored record of the
      #   request that `diagnostics.previous_message_id` references.
      #
      #   This doesn't mean that this request changed.
      #
      #   See the
      #   [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types)
      #   to learn what to change for each reason.
      #
      #   @param type [Symbol, :previous_message_not_found]
    end
  end
end
