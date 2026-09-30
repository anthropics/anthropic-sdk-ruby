# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorCoworkMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute distinct_session_connector_used_count
          #   Number of distinct Cowork sessions in which the connector was used. Approximate
          #   (HLL, typical error <2%) in date-range mode. Null on aggregated rows where a
          #   distinct count cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_session_connector_used_count, Integer, nil?: true

          # @!method initialize(distinct_session_connector_used_count:)
          #   Cowork activity metrics for a single connector on a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorCoworkMetrics} for
          #   more details.
          #
          #   @param distinct_session_connector_used_count [Integer, nil] Number of distinct Cowork sessions in which the connector was used. Approximate
        end
      end
    end
  end
end
