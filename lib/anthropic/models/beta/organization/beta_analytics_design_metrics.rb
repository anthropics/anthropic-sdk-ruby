# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsDesignMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute distinct_projects_created_count
          #   Number of distinct Claude Design projects created. Exact in date-range mode: a
          #   creation belongs to exactly one day, so the per-day counts never overlap and
          #   their sum over the window is the exact count of distinct creations in it.
          #
          #   @return [Integer]
          required :distinct_projects_created_count, Integer

          # @!attribute distinct_projects_used_count
          #   Number of distinct Claude Design projects the user worked in. Approximate (HLL,
          #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          #   count cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_projects_used_count, Integer, nil?: true

          # @!attribute distinct_session_count
          #   Number of distinct Claude Design sessions. Approximate (HLL, typical error <2%)
          #   in date-range mode. Null on aggregated rows where a distinct count cannot be
          #   computed.
          #
          #   @return [Integer, nil]
          required :distinct_session_count, Integer, nil?: true

          # @!attribute message_count
          #   Number of messages sent in Claude Design sessions
          #
          #   @return [Integer]
          required :message_count, Integer

          # @!method initialize(distinct_projects_created_count:, distinct_projects_used_count:, distinct_session_count:, message_count:)
          #   Claude Design activity metrics for a single user on a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsDesignMetrics} for more
          #   details.
          #
          #   @param distinct_projects_created_count [Integer] Number of distinct Claude Design projects created. Exact in date-range mode: a c
          #
          #   @param distinct_projects_used_count [Integer, nil] Number of distinct Claude Design projects the user worked in. Approximate (HLL,
          #
          #   @param distinct_session_count [Integer, nil] Number of distinct Claude Design sessions. Approximate (HLL, typical error <2%)
          #
          #   @param message_count [Integer] Number of messages sent in Claude Design sessions
        end
      end
    end
  end
end
