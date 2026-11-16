# frozen_string_literal: true

module Anthropic
  module Models
    class ErrorResponse < Anthropic::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::Models::InvalidRequestErrorObject, Anthropic::Models::AuthenticationErrorObject, Anthropic::Models::BillingErrorObject, Anthropic::Models::PermissionErrorObject, Anthropic::Models::NotFoundErrorObject, Anthropic::Models::RateLimitErrorObject, Anthropic::Models::GatewayTimeoutErrorObject, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedErrorObject]
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
      #   @param error [Anthropic::Models::InvalidRequestErrorObject, Anthropic::Models::AuthenticationErrorObject, Anthropic::Models::BillingErrorObject, Anthropic::Models::PermissionErrorObject, Anthropic::Models::NotFoundErrorObject, Anthropic::Models::RateLimitErrorObject, Anthropic::Models::GatewayTimeoutErrorObject, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedErrorObject]
      #   @param request_id [String, nil]
      #   @param type [Symbol, :error]
    end
  end
end
