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

            # Who submitted the increase request.
            sig do
              returns(
                Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor::Variants
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

            # Who approved or denied the increase request.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestResolvedBy::Variants
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
              # Who submitted the increase request.
              actor:,
              created_at:,
              period:,
              resolved_at:,
              # Who approved or denied the increase request.
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
                    Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor::Variants,
                  created_at: Time,
                  period:
                    Anthropic::Beta::Organization::BetaSpendLimitPeriod::TaggedSymbol,
                  resolved_at: T.nilable(Time),
                  resolved_by:
                    T.nilable(
                      Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestResolvedBy::Variants
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
          end
        end
      end
    end
  end
end
