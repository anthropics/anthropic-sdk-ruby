# typed: strong

module Anthropic
  module Models
    # The caller is not allowed to bill the user profile that the request names. The
    # response gives no more specific error code and does not say what the reason is.
    class UserProfileNotBillableError < Anthropic::Errors::PermissionDeniedError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::UserProfileNotBillableErrorDetails) }
      def details
      end
    end
  end
end
