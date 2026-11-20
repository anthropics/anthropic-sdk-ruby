# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileBillingNotAuthorizedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :user_profile_billing_not_authorized]
      required :error_code, const: :user_profile_billing_not_authorized

      # @!method initialize(error_code: :user_profile_billing_not_authorized)
      #   The customer that the request's user profile represents has not authorized the
      #   caller to bill them, or the authorization that the request's credential uses has
      #   ended. The response does not say which applies.
      #
      #   @param error_code [Symbol, :user_profile_billing_not_authorized]
    end
  end
end
