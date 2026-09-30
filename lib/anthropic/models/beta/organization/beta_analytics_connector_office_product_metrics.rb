# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorOfficeProductMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute distinct_session_connector_used_count
          #   Number of distinct Office Agent sessions in which the connector was used.
          #   Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
          #   where a distinct count cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_session_connector_used_count, Integer, nil?: true

          # @!method initialize(distinct_session_connector_used_count:)
          #   Office Agent activity metrics for a single connector on a given day within one
          #   Office product.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics}
          #   for more details.
          #
          #   @param distinct_session_connector_used_count [Integer, nil] Number of distinct Office Agent sessions in which the connector was used. Approx
        end
      end
    end
  end
end
