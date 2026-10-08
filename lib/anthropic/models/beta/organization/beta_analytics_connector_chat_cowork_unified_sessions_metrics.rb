# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorChatCoworkUnifiedSessionsMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute distinct_session_connector_used_count
          #   Same measure as `cowork_metrics.distinct_session_connector_used_count`, for
          #   activity recorded while members had Chat and Cowork unified turned on.
          #   Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
          #   where a distinct count cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_session_connector_used_count, Integer, nil?: true

          # @!method initialize(distinct_session_connector_used_count:)
          #   A connector's use in Cowork sessions recorded while members had Chat and Cowork
          #   unified turned on.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedSessionsMetrics}
          #   for more details.
          #
          #   @param distinct_session_connector_used_count [Integer, nil] Same measure as `cowork_metrics.distinct_session_connector_used_count`, for acti
        end
      end
    end
  end
end
