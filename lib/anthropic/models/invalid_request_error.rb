# frozen_string_literal: true

module Anthropic
  module Models
    class InvalidRequestError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :invalid_request_error]
      required :type, const: :invalid_request_error

      # @!method initialize(message:, type: :invalid_request_error)
      #   @param message [String]
      #   @param type [Symbol, :invalid_request_error]
    end
  end
end
