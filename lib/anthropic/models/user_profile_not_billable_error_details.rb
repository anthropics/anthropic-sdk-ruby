# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileNotBillableErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :user_profile_not_billable]
      required :error_code, const: :user_profile_not_billable

      # @!method initialize(error_code: :user_profile_not_billable)
      #   The caller is not allowed to bill the user profile that the request names. The
      #   response gives no more specific error code and does not say what the reason is.
      #
      #   @param error_code [Symbol, :user_profile_not_billable]
    end
  end
end
