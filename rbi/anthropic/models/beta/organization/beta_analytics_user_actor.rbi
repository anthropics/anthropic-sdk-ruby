# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsUserActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsUserActor,
                Anthropic::Internal::AnyHash
              )
            end

          # True when the account has been deleted, or when the user is no longer a member
          # of the organization or its associated organizations (for example, their
          # membership was removed or they were deprovisioned via your identity provider).
          # `email_address` stays populated for removed users and is null when the account
          # has been deleted. `name` follows the rules described on that field. The
          # `user_id` is still populated for reconciliation.
          sig { returns(T::Boolean) }
          attr_accessor :deleted

          # The user's email address, including for users who are no longer members of the
          # organization or its associated organizations. Null when the account has been
          # deleted (check `deleted`) and for system-minted service accounts, which have no
          # person's mailbox behind them (check `name`).
          sig { returns(T.nilable(String)) }
          attr_accessor :email_address

          # The user's full name. Null when the user has not set a name. Returns
          # `"Deleted User"` when the account itself has been deleted, or when the user is
          # no longer a member of the organization or its associated organizations and the
          # organization has chosen to hide the names of removed users. Otherwise, the name
          # stays populated for removed users. Rows for system-minted service accounts
          # render the service name (for example, `"Claude Security"` for usage by
          # Anthropic's security-patching service) or null.
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Actor type. Always `"user_actor"`.
          sig { returns(Symbol) }
          attr_accessor :type

          # Tagged user ID.
          sig { returns(String) }
          attr_accessor :user_id

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
            # True when the account has been deleted, or when the user is no longer a member
            # of the organization or its associated organizations (for example, their
            # membership was removed or they were deprovisioned via your identity provider).
            # `email_address` stays populated for removed users and is null when the account
            # has been deleted. `name` follows the rules described on that field. The
            # `user_id` is still populated for reconciliation.
            deleted:,
            # The user's email address, including for users who are no longer members of the
            # organization or its associated organizations. Null when the account has been
            # deleted (check `deleted`) and for system-minted service accounts, which have no
            # person's mailbox behind them (check `name`).
            email_address:,
            # The user's full name. Null when the user has not set a name. Returns
            # `"Deleted User"` when the account itself has been deleted, or when the user is
            # no longer a member of the organization or its associated organizations and the
            # organization has chosen to hide the names of removed users. Otherwise, the name
            # stays populated for removed users. Rows for system-minted service accounts
            # render the service name (for example, `"Claude Security"` for usage by
            # Anthropic's security-patching service) or null.
            name:,
            # Tagged user ID.
            user_id:,
            # Actor type. Always `"user_actor"`.
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
