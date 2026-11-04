# typed: strong

module Anthropic
  module Models
    # The request depends on a user profile that does not exist in the organization or
    # is no longer active. The request either names this user profile by ID, or names
    # a resource, such as an External Key, that is bound to it.
    class UserProfileNotFoundError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::UserProfileNotFoundErrorDetails) }
      def details
      end
    end
  end
end
