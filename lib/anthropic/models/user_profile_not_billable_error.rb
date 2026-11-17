# frozen_string_literal: true

module Anthropic
  module Models
    # The caller is not allowed to bill the user profile that the request names. The
    # response gives no more specific error code and does not say what the reason is.
    class UserProfileNotBillableError < Anthropic::Errors::PermissionDeniedError
      # @!method error_code
      #   @return [Symbol, :user_profile_not_billable]

      # @return [Anthropic::Models::UserProfileNotBillableErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::UserProfileNotBillableErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
