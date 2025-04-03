# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute signature
      #
      #   @return [String]
      required :signature, String

      # @!attribute thinking
      #
      #   @return [String]
      required :thinking, String

      # @!attribute type
      #
      #   @return [Symbol, :thinking]
      required :type, const: :thinking

      # @!parse
      #   # @param signature [String]
      #   # @param thinking [String]
      #   # @param type [Symbol, :thinking]
      #   #
      #   def initialize(signature:, thinking:, type: :thinking, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
