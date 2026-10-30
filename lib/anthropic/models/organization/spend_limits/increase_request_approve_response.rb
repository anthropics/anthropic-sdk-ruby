# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module SpendLimits
        # @see Anthropic::Resources::Organization::SpendLimits::IncreaseRequests#approve
        class IncreaseRequestApproveResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute actor
          #   Who submitted the increase request.
          #
          #   @return [Anthropic::Models::Organization::SpendLimitUserActor, Anthropic::Models::Organization::SpendLimitScopedAPIKeyActor]
          required :actor, union: -> { Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestActor }

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute period
          #
          #   @return [Symbol, Anthropic::Models::Organization::SpendLimitPeriod]
          required :period, enum: -> { Anthropic::Organization::SpendLimitPeriod }

          # @!attribute resolved_at
          #
          #   @return [Time, nil]
          required :resolved_at, Time, nil?: true

          # @!attribute resolved_by
          #   Who approved or denied the increase request.
          #
          #   @return [Anthropic::Models::Organization::SpendLimitUserActor, Anthropic::Models::Organization::SpendLimitScopedAPIKeyActor, nil]
          required :resolved_by,
                   union: -> { Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestResolvedBy },
                   nil?: true

          # @!attribute spend_limit
          #   A configured spend limit: a cap on metered spend for one scope and period.
          #
          #   @return [Anthropic::Models::Organization::SpendLimit]
          required :spend_limit, -> { Anthropic::Organization::SpendLimit }

          # @!attribute spend_summary
          #   Per-member effective-limit report row (`GET /spend_limits/effective`).
          #
          #   @return [Anthropic::Models::Organization::SpendSummary, nil]
          required :spend_summary, -> { Anthropic::Organization::SpendSummary }, nil?: true

          # @!attribute status
          #
          #   @return [Symbol, Anthropic::Models::Organization::SpendLimits::SpendLimitIncreaseRequestStatus]
          required :status, enum: -> { Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus }

          # @!attribute type
          #
          #   @return [Symbol, :spend_limit_increase_request]
          required :type, const: :spend_limit_increase_request

          # @!method initialize(id:, actor:, created_at:, period:, resolved_at:, resolved_by:, spend_limit:, spend_summary:, status:, type: :spend_limit_increase_request)
          #   @param id [String]
          #
          #   @param actor [Anthropic::Models::Organization::SpendLimitUserActor, Anthropic::Models::Organization::SpendLimitScopedAPIKeyActor] Who submitted the increase request.
          #
          #   @param created_at [Time]
          #
          #   @param period [Symbol, Anthropic::Models::Organization::SpendLimitPeriod]
          #
          #   @param resolved_at [Time, nil]
          #
          #   @param resolved_by [Anthropic::Models::Organization::SpendLimitUserActor, Anthropic::Models::Organization::SpendLimitScopedAPIKeyActor, nil] Who approved or denied the increase request.
          #
          #   @param spend_limit [Anthropic::Models::Organization::SpendLimit] A configured spend limit: a cap on metered spend for one scope and period.
          #
          #   @param spend_summary [Anthropic::Models::Organization::SpendSummary, nil] Per-member effective-limit report row (`GET /spend_limits/effective`).
          #
          #   @param status [Symbol, Anthropic::Models::Organization::SpendLimits::SpendLimitIncreaseRequestStatus]
          #
          #   @param type [Symbol, :spend_limit_increase_request]
        end
      end
    end
  end
end
