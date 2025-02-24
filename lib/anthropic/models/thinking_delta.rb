# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingDelta < Anthropic::BaseModel
      # @!attribute thinking
      #
      #   @return [String]
      required :thinking, String

      # @!attribute type
      #
      #   @return [Symbol, :thinking_delta]
      required :type, const: :thinking_delta

      # @!parse
      #   # @param thinking [String]
      #   # @param type [Symbol, :thinking_delta]
      #   #
      #   def initialize(thinking:, type: :thinking_delta, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
