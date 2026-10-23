# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          # @see Anthropic::Resources::Beta::Organization::Analytics::Usage#list
          class BetaAnalyticsUsageItem < Anthropic::Internal::Type::BaseModel
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
            #   The dimension values this row's usage is broken out by.
            #
            #   @return [Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsUsageGroup]
            required :group, -> { Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageGroup }

            # @!attribute starting_at
            #   Start of the period this row covers (inclusive), as an RFC 3339 UTC timestamp:
            #   the start of the row's time bucket when a time-bucket width is set, otherwise
            #   the requested `starting_at` rounded down to the hour.
            #
            #   @return [Time]
            required :starting_at, Time

            # @!attribute usage
            #   Token usage for this row.
            #
            #   @return [Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsUsageMetrics]
            required :usage, -> { Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageMetrics }

            # @!method initialize(ending_at:, group:, starting_at:, usage:)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsUsageItem} for
            #   more details.
            #
            #   @param ending_at [Time] End of the period this row covers (exclusive), as an RFC 3339 UTC timestamp: the
            #
            #   @param group [Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsUsageGroup] The dimension values this row's usage is broken out by.
            #
            #   @param starting_at [Time] Start of the period this row covers (inclusive), as an RFC 3339 UTC timestamp: t
            #
            #   @param usage [Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsUsageMetrics] Token usage for this row.
          end
        end
      end
    end
  end
end
