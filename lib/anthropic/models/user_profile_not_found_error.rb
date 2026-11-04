# frozen_string_literal: true

module Anthropic
  module Models
    # The request depends on a user profile that does not exist in the organization or
    # is no longer active. The request either names this user profile by ID, or names
    # a resource, such as an External Key, that is bound to it.
    class UserProfileNotFoundError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :user_profile_not_found]

      # @return [Anthropic::Models::UserProfileNotFoundErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::UserProfileNotFoundErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
