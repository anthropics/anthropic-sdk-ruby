# typed: strong

module Anthropic
  module Models
    module Organization
      module SpendLimits
        class IncreaseRequestApproveResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Models::Organization::SpendLimits::IncreaseRequestApproveResponse,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # Who submitted the increase request.
          sig do
            returns(
              Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestActor::Variants
            )
          end
          attr_accessor :actor

          sig { returns(Time) }
          attr_accessor :created_at

          sig do
            returns(Anthropic::Organization::SpendLimitPeriod::TaggedSymbol)
          end
          attr_accessor :period

          sig { returns(T.nilable(Time)) }
          attr_accessor :resolved_at

          # Who approved or denied the increase request.
          sig do
            returns(
              T.nilable(
                Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestResolvedBy::Variants
              )
            )
          end
          attr_accessor :resolved_by

          # A configured spend limit: a cap on metered spend for one scope and period.
          sig { returns(Anthropic::Organization::SpendLimit) }
          attr_reader :spend_limit

          sig do
            params(
              spend_limit: Anthropic::Organization::SpendLimit::OrHash
            ).void
          end
          attr_writer :spend_limit

          # Per-member effective-limit report row (`GET /spend_limits/effective`).
          sig { returns(T.nilable(Anthropic::Organization::SpendSummary)) }
          attr_reader :spend_summary

          sig do
            params(
              spend_summary:
                T.nilable(Anthropic::Organization::SpendSummary::OrHash)
            ).void
          end
          attr_writer :spend_summary

          sig do
            returns(
              Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus::TaggedSymbol
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
                  Anthropic::Organization::SpendLimitUserActor::OrHash,
                  Anthropic::Organization::SpendLimitScopedAPIKeyActor::OrHash
                ),
              created_at: Time,
              period: Anthropic::Organization::SpendLimitPeriod::OrSymbol,
              resolved_at: T.nilable(Time),
              resolved_by:
                T.nilable(
                  T.any(
                    Anthropic::Organization::SpendLimitUserActor::OrHash,
                    Anthropic::Organization::SpendLimitScopedAPIKeyActor::OrHash
                  )
                ),
              spend_limit: Anthropic::Organization::SpendLimit::OrHash,
              spend_summary:
                T.nilable(Anthropic::Organization::SpendSummary::OrHash),
              status:
                Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus::OrSymbol,
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
                  Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestActor::Variants,
                created_at: Time,
                period: Anthropic::Organization::SpendLimitPeriod::TaggedSymbol,
                resolved_at: T.nilable(Time),
                resolved_by:
                  T.nilable(
                    Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestResolvedBy::Variants
                  ),
                spend_limit: Anthropic::Organization::SpendLimit,
                spend_summary: T.nilable(Anthropic::Organization::SpendSummary),
                status:
                  Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus::TaggedSymbol,
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
