# frozen_string_literal: true

module Anthropic
  module Models
    # The request sets `billing_policy.bill_to` to `"user_profile"` but names no user
    # profile. Name the profile to bill in the `anthropic-user-profile-id` header.
    class UserProfileRequiredError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :user_profile_required]

      # @return [Anthropic::Models::UserProfileRequiredErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::UserProfileRequiredErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
