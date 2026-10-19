# typed: strong

module Anthropic
  module Models
    BetaDeletedUserProfile = Beta::BetaDeletedUserProfile

    module Beta
      class BetaDeletedUserProfile < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDeletedUserProfile,
              Anthropic::Internal::AnyHash
            )
          end

        # Identifier of the deleted user profile, prefixed `uprof_`.
        sig { returns(String) }
        attr_accessor :id

        # Object type. Always `user_profile_deleted`.
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Identifier of the deleted user profile, prefixed `uprof_`.
          id:,
          # Object type. Always `user_profile_deleted`.
          type: :user_profile_deleted
        )
        end

        sig { override.returns({ id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
