# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorChatCoworkUnifiedChatMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute distinct_conversation_connector_used_count
          #   Same measure as `chat_metrics.distinct_conversation_connector_used_count`, for
          #   activity recorded while members had Chat and Cowork unified turned on.
          #   Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
          #   where a distinct count cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_conversation_connector_used_count, Integer, nil?: true

          # @!method initialize(distinct_conversation_connector_used_count:)
          #   A connector's use in chat conversations recorded while members had Chat and
          #   Cowork unified turned on.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedChatMetrics}
          #   for more details.
          #
          #   @param distinct_conversation_connector_used_count [Integer, nil] Same measure as `chat_metrics.distinct_conversation_connector_used_count`, for a
        end
      end
    end
  end
end
