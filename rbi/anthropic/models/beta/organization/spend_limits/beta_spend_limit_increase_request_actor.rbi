# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          # Who submitted the increase request.
          module BetaSpendLimitIncreaseRequestActor
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaSpendLimitUserActor,
                  Anthropic::Beta::Organization::BetaSpendLimitScopedAPIKeyActor
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              USER_ACTOR =
                T.let(
                  :user_actor,
                  Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor::Type::TaggedSymbol
                )
              SCOPED_API_KEY_ACTOR =
                T.let(
                  :scoped_api_key_actor,
                  Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type:
                  Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor::Type::OrSymbol,
                deleted: T::Boolean,
                email_address: T.nilable(String),
                name: T.nilable(String),
                user_id: String,
                scoped_api_key_id: String
              ).returns(
                Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor::Variants
              )
            end
            def self.new(
              type:,
              # True only when the underlying account has been deleted.
              deleted: nil,
              # The user's email address. Null when the account is unavailable or has been
              # deleted.
              email_address: nil,
              # The user's current display name. Null when the account is unavailable, has been
              # deleted, or has no name set.
              name: nil,
              # Tagged ID of the user.
              user_id: nil,
              scoped_api_key_id: nil
            )
            end
          end
        end
      end
    end
  end
end
