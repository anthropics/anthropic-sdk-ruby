# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsOfficeProductMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute connectors_used_count
          #   Number of MCP connector invocations
          #
          #   @return [Integer]
          required :connectors_used_count, Integer

          # @!attribute distinct_connectors_used_count
          #   Number of distinct MCP connectors used. Approximate (HLL, typical error <2%) in
          #   date-range mode. Null on aggregated rows where a distinct count cannot be
          #   computed.
          #
          #   @return [Integer, nil]
          required :distinct_connectors_used_count, Integer, nil?: true

          # @!attribute distinct_session_count
          #   Number of distinct Office Agent sessions. Approximate (HLL, typical error <2%)
          #   in date-range mode. Null on aggregated rows where a distinct count cannot be
          #   computed.
          #
          #   @return [Integer, nil]
          required :distinct_session_count, Integer, nil?: true

          # @!attribute distinct_skills_used_count
          #   Number of distinct skills used. Approximate (HLL, typical error <2%) in
          #   date-range mode. Null on aggregated rows where a distinct count cannot be
          #   computed.
          #
          #   @return [Integer, nil]
          required :distinct_skills_used_count, Integer, nil?: true

          # @!attribute message_count
          #   Number of messages sent
          #
          #   @return [Integer]
          required :message_count, Integer

          # @!attribute skills_used_count
          #   Number of skill invocations
          #
          #   @return [Integer]
          required :skills_used_count, Integer

          # @!method initialize(connectors_used_count:, distinct_connectors_used_count:, distinct_session_count:, distinct_skills_used_count:, message_count:, skills_used_count:)
          #   Office Agent activity metrics for a single user on a given day within one Office
          #   product.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeProductMetrics} for
          #   more details.
          #
          #   @param connectors_used_count [Integer] Number of MCP connector invocations
          #
          #   @param distinct_connectors_used_count [Integer, nil] Number of distinct MCP connectors used. Approximate (HLL, typical error <2%) in
          #
          #   @param distinct_session_count [Integer, nil] Number of distinct Office Agent sessions. Approximate (HLL, typical error <2%) i
          #
          #   @param distinct_skills_used_count [Integer, nil] Number of distinct skills used. Approximate (HLL, typical error <2%) in date-ran
          #
          #   @param message_count [Integer] Number of messages sent
          #
          #   @param skills_used_count [Integer] Number of skill invocations
        end
      end
    end
  end
end
