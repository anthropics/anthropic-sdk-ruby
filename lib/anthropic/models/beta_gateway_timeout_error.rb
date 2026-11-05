# frozen_string_literal: true

module Anthropic
  module Models
    class BetaGatewayTimeoutError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #   A human-readable explanation of the error. Its wording can change, so don't
      #   match on it.
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #   The broad category of the error.
      #
      #   @return [Symbol, :timeout_error]
      required :type, const: :timeout_error

      # @!method initialize(message:, type: :timeout_error)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BetaGatewayTimeoutError} for more details.
      #
      #   @param message [String] A human-readable explanation of the error. Its wording can change, so don't matc
      #
      #   @param type [Symbol, :timeout_error] The broad category of the error.
    end
  end
end
