# frozen_string_literal: true

module Anthropic
  module Models
    class BetaOverloadedError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :overloaded_error]
      required :type, const: :overloaded_error

      # @!parse
      #   # @param message [String]
      #   # @param type [Symbol, :overloaded_error]
      #   #
      #   def initialize(message:, type: :overloaded_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
