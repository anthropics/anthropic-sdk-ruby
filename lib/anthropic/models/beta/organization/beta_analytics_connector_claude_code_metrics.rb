# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorClaudeCodeMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute distinct_session_connector_used_count
          #   Number of distinct Claude Code sessions in which the connector was used.
          #   Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
          #   where a distinct count cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_session_connector_used_count, Integer, nil?: true

          # @!method initialize(distinct_session_connector_used_count:)
          #   Claude Code activity metrics for a single connector on a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorClaudeCodeMetrics}
          #   for more details.
          #
          #   @param distinct_session_connector_used_count [Integer, nil] Number of distinct Claude Code sessions in which the connector was used. Approxi
        end
      end
    end
  end
end
