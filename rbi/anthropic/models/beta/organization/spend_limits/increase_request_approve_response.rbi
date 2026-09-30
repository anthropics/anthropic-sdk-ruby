# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          class IncreaseRequestApproveResponse < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig do
              returns(
                Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor::Variants
              )
            end
            attr_accessor :actor

            sig { returns(Time) }
            attr_accessor :created_at

            sig do
              returns(
                Anthropic::Beta::Organization::BetaSpendLimitPeriod::TaggedSymbol
              )
            end
            attr_accessor :period

            sig { returns(T.nilable(Time)) }
            attr_accessor :resolved_at

            sig do
              returns(
                T.nilable(
                  Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy::Variants
                )
              )
            end
            attr_accessor :resolved_by

            # A configured spend limit: a cap on metered spend for one scope and period.
            sig { returns(Anthropic::Beta::Organization::BetaSpendLimit) }
            attr_reader :spend_limit

            sig do
              params(
                spend_limit:
                  Anthropic::Beta::Organization::BetaSpendLimit::OrHash
              ).void
            end
            attr_writer :spend_limit

            # Per-member effective-limit report row (`GET /spend_limits/effective`).
            sig do
              returns(
                T.nilable(Anthropic::Beta::Organization::BetaSpendSummary)
              )
            end
            attr_reader :spend_summary

            sig do
              params(
                spend_summary:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaSpendSummary::OrHash
                  )
              ).void
            end
            attr_writer :spend_summary

            sig do
              returns(
                Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus::TaggedSymbol
              )
            end
            attr_accessor :status

            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(
                id: String,
                actor:
                  T.any(
                    Anthropic::Beta::Organization::BetaSpendLimitUserActor::OrHash,
                    Anthropic::Beta::Organization::BetaSpendLimitScopedAPIKeyActor::OrHash
                  ),
                created_at: Time,
                period:
                  Anthropic::Beta::Organization::BetaSpendLimitPeriod::OrSymbol,
                resolved_at: T.nilable(Time),
                resolved_by:
                  T.nilable(
                    T.any(
                      Anthropic::Beta::Organization::BetaSpendLimitUserActor::OrHash,
                      Anthropic::Beta::Organization::BetaSpendLimitScopedAPIKeyActor::OrHash
                    )
                  ),
                spend_limit:
                  Anthropic::Beta::Organization::BetaSpendLimit::OrHash,
                spend_summary:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaSpendSummary::OrHash
                  ),
                status:
                  Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus::OrSymbol,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              id:,
              actor:,
              created_at:,
              period:,
              resolved_at:,
              resolved_by:,
              # A configured spend limit: a cap on metered spend for one scope and period.
              spend_limit:,
              # Per-member effective-limit report row (`GET /spend_limits/effective`).
              spend_summary:,
              status:,
              type: :spend_limit_increase_request
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  actor:
                    Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor::Variants,
                  created_at: Time,
                  period:
                    Anthropic::Beta::Organization::BetaSpendLimitPeriod::TaggedSymbol,
                  resolved_at: T.nilable(Time),
                  resolved_by:
                    T.nilable(
                      Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy::Variants
                    ),
                  spend_limit: Anthropic::Beta::Organization::BetaSpendLimit,
                  spend_summary:
                    T.nilable(Anthropic::Beta::Organization::BetaSpendSummary),
                  status:
                    Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus::TaggedSymbol,
                  type: Symbol
                }
              )
            end
            def to_hash
            end

            module Actor
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
                      Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                USER_ACTOR =
                  T.let(
                    :user_actor,
                    Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor::Type::TaggedSymbol
                  )
                SCOPED_API_KEY_ACTOR =
                  T.let(
                    :scoped_api_key_actor,
                    Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor::Variants
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
                    Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor::Type::OrSymbol,
                  deleted: T::Boolean,
                  email_address: T.nilable(String),
                  name: T.nilable(String),
                  user_id: String,
                  scoped_api_key_id: String
                ).returns(
                  Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor::Variants
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

            module ResolvedBy
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
                      Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                USER_ACTOR =
                  T.let(
                    :user_actor,
                    Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy::Type::TaggedSymbol
                  )
                SCOPED_API_KEY_ACTOR =
                  T.let(
                    :scoped_api_key_actor,
                    Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy::Variants
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
                    Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy::Type::OrSymbol,
                  deleted: T::Boolean,
                  email_address: T.nilable(String),
                  name: T.nilable(String),
                  user_id: String,
                  scoped_api_key_id: String
                ).returns(
                  Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy::Variants
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
end
