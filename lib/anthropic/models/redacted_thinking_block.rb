# frozen_string_literal: true

module Anthropic
  module Models
    class RedactedThinkingBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [String]
      required :data, String

      # @!attribute type
      #
      #   @return [Symbol, :redacted_thinking]
      required :type, const: :redacted_thinking

      # @!method initialize(data:, type: :redacted_thinking)
      #   @param data [String]
      #   @param type [Symbol, :redacted_thinking]
    end
  end
end
