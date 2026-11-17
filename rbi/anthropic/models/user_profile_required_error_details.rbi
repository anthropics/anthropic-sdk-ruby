# typed: strong

module Anthropic
  module Models
    class UserProfileRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::UserProfileRequiredErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The request sets `billing_policy.bill_to` to `"user_profile"` but names no user
      # profile. Name the profile to bill in the `anthropic-user-profile-id` header.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :user_profile_required)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
