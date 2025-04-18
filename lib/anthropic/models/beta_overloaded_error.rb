# frozen_string_literal: true

module Anthropic
  module Models
    class BetaOverloadedError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :overloaded_error]
      required :type, const: :overloaded_error

      # @!method initialize(message:, type: :overloaded_error)
      #   @param message [String]
      #   @param type [Symbol, :overloaded_error]
    end
  end
end
