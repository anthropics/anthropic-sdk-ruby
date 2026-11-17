# typed: strong

module Anthropic
  module Models
    # The request sets `billing_policy.bill_to` to `"user_profile"` but names no user
    # profile. Name the profile to bill in the `anthropic-user-profile-id` header.
    class UserProfileRequiredError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::UserProfileRequiredErrorDetails) }
      def details
      end
    end
  end
end
