# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AnalyticsConnectorChatMetrics < Anthropic::Internal::Type::BaseModel
        # @!attribute distinct_conversation_connector_used_count
        #   Number of distinct conversations in which the connector was used. Approximate
        #   (HLL, typical error <2%) in date-range mode. Null on aggregated rows where a
        #   distinct count cannot be computed.
        #
        #   @return [Integer, nil]
        required :distinct_conversation_connector_used_count, Integer, nil?: true

        # @!method initialize(distinct_conversation_connector_used_count:)
        #   Claude.ai activity metrics for a single connector on a given day.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::AnalyticsConnectorChatMetrics} for more
        #   details.
        #
        #   @param distinct_conversation_connector_used_count [Integer, nil] Number of distinct conversations in which the connector was used. Approximate (H
      end
    end
  end
end
