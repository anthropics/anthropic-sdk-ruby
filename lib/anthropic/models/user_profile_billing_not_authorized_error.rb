# frozen_string_literal: true

module Anthropic
  module Models
    # The customer that the request's user profile represents has not authorized the
    # caller to bill them, or the authorization that the request's credential uses has
    # ended. The response does not say which applies.
    class UserProfileBillingNotAuthorizedError < Anthropic::Errors::PermissionDeniedError
      # @!method error_code
      #   @return [Symbol, :user_profile_billing_not_authorized]

      # @return [Anthropic::Models::UserProfileBillingNotAuthorizedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::UserProfileBillingNotAuthorizedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
