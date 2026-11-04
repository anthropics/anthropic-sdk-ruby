# typed: strong

module Anthropic
  module Models
    class UserProfileNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::UserProfileNotFoundErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The request depends on a user profile that does not exist in the organization or
      # is no longer active. The request either names this user profile by ID, or names
      # a resource, such as an External Key, that is bound to it.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :user_profile_not_found)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
