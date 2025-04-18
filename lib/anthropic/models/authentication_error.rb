# frozen_string_literal: true

module Anthropic
  module Models
    class AuthenticationError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :authentication_error]
      required :type, const: :authentication_error

      # @!method initialize(message:, type: :authentication_error)
      #   @param message [String]
      #   @param type [Symbol, :authentication_error]
    end
  end
end
