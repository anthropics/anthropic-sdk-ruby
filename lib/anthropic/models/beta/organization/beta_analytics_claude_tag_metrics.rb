# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsClaudeTagMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute active_day_count
          #   1 on a day the user was active in Claude Tag in Slack, otherwise 0. Summed over
          #   the window in date-range mode, so it is the number of active days; on grouped
          #   rows, the total of each member's active days. Null when Claude Tag data cannot
          #   be read for the request. Otherwise, 0 on a row filtered by project, and null on
          #   any other row when no covered day was measured.
          #
          #   @return [Integer, nil]
          required :active_day_count, Integer, nil?: true

          # @!attribute active_message_count
          #   Number of the user's Slack messages that made them active: @-mentions, direct
          #   messages, group direct message asks, and thread posts Claude answered. Other
          #   messages are not counted. Null when Claude Tag data cannot be read for the
          #   request. Otherwise, 0 on a row filtered by project, and null on any other row
          #   when no covered day was measured.
          #
          #   @return [Integer, nil]
          required :active_message_count, Integer, nil?: true

          # @!method initialize(active_day_count:, active_message_count:)
          #   Claude Tag activity metrics for a single linked user on a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeTagMetrics} for more
          #   details.
          #
          #   @param active_day_count [Integer, nil] 1 on a day the user was active in Claude Tag in Slack, otherwise 0. Summed over
          #
          #   @param active_message_count [Integer, nil] Number of the user's Slack messages that made them active: @-mentions, direct me
        end
      end
    end
  end
end
