# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitUserActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaSpendLimitUserActor,
                Anthropic::Internal::AnyHash
              )
            end

          # True only when the underlying account has been deleted.
          sig { returns(T::Boolean) }
          attr_accessor :deleted

          # The user's email address. Null when the account is unavailable or has been
          # deleted.
          sig { returns(T.nilable(String)) }
          attr_accessor :email_address

          # The user's current display name. Null when the account is unavailable, has been
          # deleted, or has no name set.
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Actor type. Always `user_actor`.
          sig { returns(Symbol) }
          attr_accessor :type

          # Tagged ID of the user.
          sig { returns(String) }
          attr_accessor :user_id

          # A user within the organization. `name` and `email_address` are null when the
          # underlying account is unavailable or has been deleted; `deleted` is true only
          # for deleted accounts.
          sig do
            params(
              deleted: T::Boolean,
              email_address: T.nilable(String),
              name: T.nilable(String),
              user_id: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # True only when the underlying account has been deleted.
            deleted:,
            # The user's email address. Null when the account is unavailable or has been
            # deleted.
            email_address:,
            # The user's current display name. Null when the account is unavailable, has been
            # deleted, or has no name set.
            name:,
            # Tagged ID of the user.
            user_id:,
            # Actor type. Always `user_actor`.
            type: :user_actor
          )
          end

          sig do
            override.returns(
              {
                deleted: T::Boolean,
                email_address: T.nilable(String),
                name: T.nilable(String),
                type: Symbol,
                user_id: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
