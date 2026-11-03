# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :user_profile_not_found]
      required :error_code, const: :user_profile_not_found

      # @!method initialize(error_code: :user_profile_not_found)
      #   The request depends on a user profile that does not exist in the organization or
      #   is no longer active. The request either names this user profile by ID, or names
      #   a resource, such as an External Key, that is bound to it.
      #
      #   @param error_code [Symbol, :user_profile_not_found]
    end
  end
end
