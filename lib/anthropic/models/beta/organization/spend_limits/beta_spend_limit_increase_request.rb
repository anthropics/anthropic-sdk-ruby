# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          # @see Anthropic::Resources::Beta::Organization::SpendLimits::IncreaseRequests#retrieve
          class BetaSpendLimitIncreaseRequest < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!attribute actor
            #   Who submitted the increase request.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor]
            required :actor,
                     union: -> { Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor }

            # @!attribute created_at
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute period
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod]
            required :period, enum: -> { Anthropic::Beta::Organization::BetaSpendLimitPeriod }

            # @!attribute resolved_at
            #
            #   @return [Time, nil]
            required :resolved_at, Time, nil?: true

            # @!attribute resolved_by
            #   Who approved or denied the increase request.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor, nil]
            required :resolved_by,
                     union: -> {
                       Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestResolvedBy
                     },
                     nil?: true

            # @!attribute spend_summary
            #   Per-member effective-limit report row (`GET /spend_limits/effective`).
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaSpendSummary, nil]
            required :spend_summary, -> { Anthropic::Beta::Organization::BetaSpendSummary }, nil?: true

            # @!attribute status
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus]
            required :status,
                     enum: -> { Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus }

            # @!attribute type
            #
            #   @return [Symbol, :spend_limit_increase_request]
            required :type, const: :spend_limit_increase_request

            # @!method initialize(id:, actor:, created_at:, period:, resolved_at:, resolved_by:, spend_summary:, status:, type: :spend_limit_increase_request)
            #   @param id [String]
            #
            #   @param actor [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor] Who submitted the increase request.
            #
            #   @param created_at [Time]
            #
            #   @param period [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod]
            #
            #   @param resolved_at [Time, nil]
            #
            #   @param resolved_by [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor, nil] Who approved or denied the increase request.
            #
            #   @param spend_summary [Anthropic::Models::Beta::Organization::BetaSpendSummary, nil] Per-member effective-limit report row (`GET /spend_limits/effective`).
            #
            #   @param status [Symbol, Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus]
            #
            #   @param type [Symbol, :spend_limit_increase_request]
          end
        end
      end
    end
  end
end
