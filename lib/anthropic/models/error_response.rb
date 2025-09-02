# frozen_string_literal: true

module Anthropic
  module Models
    class ErrorResponse < Anthropic::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::Models::InvalidRequestError, Anthropic::Models::AuthenticationError, Anthropic::Models::BillingError, Anthropic::Models::PermissionError, Anthropic::Models::NotFoundError, Anthropic::Models::RateLimitError, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedError]
      required :error, union: -> { Anthropic::ErrorObject }

      # @!attribute request_id
      #
      #   @return [String, nil]
      required :request_id, String, nil?: true

      # @!attribute type
      #
      #   @return [Symbol, :error]
      required :type, const: :error

      # @!method initialize(error:, request_id:, type: :error)
      #   @param error [Anthropic::Models::InvalidRequestError, Anthropic::Models::AuthenticationError, Anthropic::Models::BillingError, Anthropic::Models::PermissionError, Anthropic::Models::NotFoundError, Anthropic::Models::RateLimitError, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedError]
      #   @param request_id [String, nil]
      #   @param type [Symbol, :error]
    end
  end
end
