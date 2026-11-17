# frozen_string_literal: true

module Anthropic
  module Models
    class BetaErrorResponse < Anthropic::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::Models::BetaInvalidRequestErrorObject, Anthropic::Models::BetaAuthenticationErrorObject, Anthropic::Models::BetaBillingErrorObject, Anthropic::Models::BetaPermissionErrorObject, Anthropic::Models::BetaNotFoundErrorObject, Anthropic::Models::BetaRateLimitErrorObject, Anthropic::Models::BetaGatewayTimeoutErrorObject, Anthropic::Models::BetaAPIErrorObject, Anthropic::Models::BetaOverloadedErrorObject]
      required :error, union: -> { Anthropic::BetaErrorObject }

      # @!attribute request_id
      #
      #   @return [String, nil]
      required :request_id, String, nil?: true

      # @!attribute type
      #
      #   @return [Symbol, :error]
      required :type, const: :error

      # @!method initialize(error:, request_id:, type: :error)
      #   @param error [Anthropic::Models::BetaInvalidRequestErrorObject, Anthropic::Models::BetaAuthenticationErrorObject, Anthropic::Models::BetaBillingErrorObject, Anthropic::Models::BetaPermissionErrorObject, Anthropic::Models::BetaNotFoundErrorObject, Anthropic::Models::BetaRateLimitErrorObject, Anthropic::Models::BetaGatewayTimeoutErrorObject, Anthropic::Models::BetaAPIErrorObject, Anthropic::Models::BetaOverloadedErrorObject]
      #   @param request_id [String, nil]
      #   @param type [Symbol, :error]
    end
  end
end
