# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsPluginCoworkMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute distinct_session_plugin_used_count
          #   Number of distinct Cowork sessions in which the plugin was invoked. Null on
          #   aggregated rows where a distinct count cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_session_plugin_used_count, Integer, nil?: true

          # @!method initialize(distinct_session_plugin_used_count:)
          #   Cowork activity metrics for a single plugin on a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsPluginCoworkMetrics} for
          #   more details.
          #
          #   @param distinct_session_plugin_used_count [Integer, nil] Number of distinct Cowork sessions in which the plugin was invoked. Null on aggr
        end
      end
    end
  end
end
