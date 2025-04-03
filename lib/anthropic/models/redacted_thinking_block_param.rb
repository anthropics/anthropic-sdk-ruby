# frozen_string_literal: true

module Anthropic
  module Models
    class RedactedThinkingBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [String]
      required :data, String

      # @!attribute type
      #
      #   @return [Symbol, :redacted_thinking]
      required :type, const: :redacted_thinking

      # @!parse
      #   # @param data [String]
      #   # @param type [Symbol, :redacted_thinking]
      #   #
      #   def initialize(data:, type: :redacted_thinking, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
