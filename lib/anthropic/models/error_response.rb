# frozen_string_literal: true

module Anthropic
  module Models
    class ErrorResponse < Anthropic::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::InvalidRequestError, Anthropic::AuthenticationError, Anthropic::BillingError, Anthropic::PermissionError, Anthropic::NotFoundError, Anthropic::RateLimitError, Anthropic::GatewayTimeoutError, Anthropic::APIErrorObject, Anthropic::OverloadedError]
      required :error, union: -> { Anthropic::ErrorObject }

      # @!attribute type
      #
      #   @return [Symbol, :error]
      required :type, const: :error

      # @!method initialize(error:, type: :error)
      #   @param error [Anthropic::InvalidRequestError, Anthropic::AuthenticationError, Anthropic::BillingError, Anthropic::PermissionError, Anthropic::NotFoundError, Anthropic::RateLimitError, Anthropic::GatewayTimeoutError, Anthropic::APIErrorObject, Anthropic::OverloadedError]
      #   @param type [Symbol, :error]
    end
  end
end
