# frozen_string_literal: true

module Anthropic
  module Models
    class BetaAuthenticationError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :authentication_error]
      required :type, const: :authentication_error

      # @!parse
      #   # @param message [String]
      #   # @param type [Symbol, :authentication_error]
      #   #
      #   def initialize(message:, type: :authentication_error, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
