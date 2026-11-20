# typed: strong

module Anthropic
  module Models
    # The customer that the request's user profile represents has not authorized the
    # caller to bill them, or the authorization that the request's credential uses has
    # ended. The response does not say which applies.
    class UserProfileBillingNotAuthorizedError < Anthropic::Errors::PermissionDeniedError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::UserProfileBillingNotAuthorizedErrorDetails) }
      def details
      end
    end
  end
end
