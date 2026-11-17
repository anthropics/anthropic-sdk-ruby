# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :user_profile_required]
      required :error_code, const: :user_profile_required

      # @!method initialize(error_code: :user_profile_required)
      #   The request sets `billing_policy.bill_to` to `"user_profile"` but names no user
      #   profile. Name the profile to bill in the `anthropic-user-profile-id` header.
      #
      #   @param error_code [Symbol, :user_profile_required]
    end
  end
end
