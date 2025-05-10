# frozen_string_literal: true

module Anthropic
  module Models
    class BetaGatewayTimeoutError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :timeout_error]
      required :type, const: :timeout_error

      # @!method initialize(message:, type: :timeout_error)
      #   @param message [String]
      #   @param type [Symbol, :timeout_error]
    end
  end
end
