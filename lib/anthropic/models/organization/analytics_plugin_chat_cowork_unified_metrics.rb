# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AnalyticsPluginChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
        # @!attribute distinct_session_plugin_used_count
        #   Same measure as `cowork_metrics.distinct_session_plugin_used_count`, for
        #   activity recorded while members had Chat and Cowork unified turned on. Null on
        #   aggregated rows where a distinct count cannot be computed.
        #
        #   @return [Integer, nil]
        required :distinct_session_plugin_used_count, Integer, nil?: true

        # @!method initialize(distinct_session_plugin_used_count:)
        #   A plugin's use in Cowork sessions recorded while members had Chat and Cowork
        #   unified turned on.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::AnalyticsPluginChatCoworkUnifiedMetrics} for
        #   more details.
        #
        #   @param distinct_session_plugin_used_count [Integer, nil] Same measure as `cowork_metrics.distinct_session_plugin_used_count`, for activit
      end
    end
  end
end
