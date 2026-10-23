# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          # @see Anthropic::Resources::Beta::Organization::Analytics::Cost#list
          class BetaAnalyticsCostItem < Anthropic::Internal::Type::BaseModel
            # @!attribute cost
            #   Cost for this row.
            #
            #   @return [Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostMetrics]
            required :cost, -> { Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostMetrics }

            # @!attribute ending_at
            #   End of the period this row covers (exclusive), as an RFC 3339 UTC timestamp: the
            #   end of the row's time bucket when a time-bucket width is set; otherwise the
            #   requested `ending_at` (or, when omitted, the earlier of now and `starting_at`
            #   plus 31 days) rounded down to the hour, because without a time bucket the report
            #   covers whole hours.
            #
            #   @return [Time]
            required :ending_at, Time

            # @!attribute group
            #   The dimension values this row's cost is broken out by.
            #
            #   @return [Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostGroup]
            required :group, -> { Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroup }

            # @!attribute starting_at
            #   Start of the period this row covers (inclusive), as an RFC 3339 UTC timestamp:
            #   the start of the row's time bucket when a time-bucket width is set, otherwise
            #   the requested `starting_at` rounded down to the hour.
            #
            #   @return [Time]
            required :starting_at, Time

            # @!method initialize(cost:, ending_at:, group:, starting_at:)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostItem} for
            #   more details.
            #
            #   @param cost [Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostMetrics] Cost for this row.
            #
            #   @param ending_at [Time] End of the period this row covers (exclusive), as an RFC 3339 UTC timestamp: the
            #
            #   @param group [Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostGroup] The dimension values this row's cost is broken out by.
            #
            #   @param starting_at [Time] Start of the period this row covers (inclusive), as an RFC 3339 UTC timestamp: t
          end
        end
      end
    end
  end
end
