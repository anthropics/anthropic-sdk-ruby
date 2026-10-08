# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute distinct_session_skill_used_count
          #   Same measure as `cowork_metrics.distinct_session_skill_used_count`, for activity
          #   recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
          #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          #   count cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_session_skill_used_count, Integer, nil?: true

          # @!method initialize(distinct_session_skill_used_count:)
          #   A skill's use in Cowork sessions recorded while members had Chat and Cowork
          #   unified turned on.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics}
          #   for more details.
          #
          #   @param distinct_session_skill_used_count [Integer, nil] Same measure as `cowork_metrics.distinct_session_skill_used_count`, for activity
        end
      end
    end
  end
end
