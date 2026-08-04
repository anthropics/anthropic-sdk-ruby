# frozen_string_literal: true

module Anthropic
  module Models
    class RedactedThinkingBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute data
      #   The `data` value of this redacted thinking block, exactly as returned by the API
      #   in a previous response. Opaque and encrypted; pass it back unchanged.
      #
      #   @return [String]
      required :data, String

      # @!attribute type
      #
      #   @return [Symbol, :redacted_thinking]
      required :type, const: :redacted_thinking

      # @!method initialize(data:, type: :redacted_thinking)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::RedactedThinkingBlockParam} for more details.
      #
      #   @param data [String] The `data` value of this redacted thinking block, exactly as returned by the API
      #
      #   @param type [Symbol, :redacted_thinking]
    end
  end
end
