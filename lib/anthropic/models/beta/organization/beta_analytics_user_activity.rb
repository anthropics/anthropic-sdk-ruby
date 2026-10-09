# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsUserActivity < Anthropic::Internal::Type::BaseModel
          # @!attribute chat_metrics
          #   Claude.ai activity metrics for a single user on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsChatMetrics]
          required :chat_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsChatMetrics }

          # @!attribute claude_code_metrics
          #   Claude Code activity metrics for a single user on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeCodeMetrics]
          required :claude_code_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsClaudeCodeMetrics }

          # @!attribute cowork_metrics
          #   Cowork activity metrics for a single user on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsCoworkMetrics]
          required :cowork_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsCoworkMetrics }

          # @!attribute design_metrics
          #   Claude Design activity metrics for a single user on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsDesignMetrics]
          required :design_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsDesignMetrics }

          # @!attribute office_metrics
          #   Office Agent activity metrics for a single user on a given day, broken out by
          #   Office product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeMetrics]
          required :office_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsOfficeMetrics }

          # @!attribute science_metrics
          #   Claude Science activity metrics for a single user on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsScienceMetrics]
          required :science_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsScienceMetrics }

          # @!attribute web_search_count
          #   Number of web searches performed
          #
          #   @return [Integer]
          required :web_search_count, Integer

          # @!attribute chat_cowork_unified_metrics
          #   Activity recorded while the member had Chat and Cowork unified (Cowork's
          #   features inside claude.ai chat) turned on, split into `chat` (chat activity) and
          #   `sessions` (Cowork activity). Omitted from the response on deployments that do
          #   not offer Chat and Cowork unified.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics, nil]
          optional :chat_cowork_unified_metrics,
                   -> { Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics },
                   nil?: true

          # @!attribute distinct_user_count
          #   Number of distinct active users represented by this row. Only set for grouped
          #   rollups (`group_by[]`); null for per-user rows. In date-range mode, recomputed
          #   as an exact distinct count of the group's active members over the requested
          #   window, never a sum of per-day values.
          #
          #   @return [Integer, nil]
          optional :distinct_user_count, Integer, nil?: true

          # @!attribute last_activity_date
          #   Most recent UTC day (YYYY-MM-DD) on which the user had any counted activity,
          #   within the requested window: equal to the requested `date` in single-day mode,
          #   and to the latest active day from `starting_date` (inclusive) to `ending_date`
          #   (exclusive) in date-range rollup mode — never a day earlier than the window
          #   start. On filtered requests (`filter[]`) only days matching the filter count:
          #   with `filter[]=rbac_group_id:{id}` it is the last day the user was active while
          #   a member of that group, consistent with the row's other metrics. On grouped
          #   (`group_by[]`) rows it is the latest day any member of the group was active (the
          #   requested `date` in single-day mode). Omitted from the response while
          #   last-activity reporting is not enabled for this organization.
          #
          #   @return [Date, nil]
          optional :last_activity_date, Date, nil?: true

          # @!attribute rbac_group_id
          #   Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API
          #   spelling. Present only when the request grouped by `rbac_group_id`.
          #
          #   @return [String, nil]
          optional :rbac_group_id, String, nil?: true

          # @!attribute rbac_group_name
          #   Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
          #   is available. Null if the group has been deleted or its name could not be
          #   resolved; `rbac_group_id` remains the stable key.
          #
          #   @return [String, nil]
          optional :rbac_group_name, String, nil?: true

          # @!attribute user
          #   The user this row describes. Null on rows aggregated across users.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsUser, nil]
          optional :user, -> { Anthropic::Beta::Organization::BetaAnalyticsUser }, nil?: true

          # @!method initialize(chat_metrics:, claude_code_metrics:, cowork_metrics:, design_metrics:, office_metrics:, science_metrics:, web_search_count:, chat_cowork_unified_metrics: nil, distinct_user_count: nil, last_activity_date: nil, rbac_group_id: nil, rbac_group_name: nil, user: nil)
          #   Per-user activity data for a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity} for more
          #   details.
          #
          #   @param chat_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsChatMetrics] Claude.ai activity metrics for a single user on a given day.
          #
          #   @param claude_code_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeCodeMetrics] Claude Code activity metrics for a single user on a given day.
          #
          #   @param cowork_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsCoworkMetrics] Cowork activity metrics for a single user on a given day.
          #
          #   @param design_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsDesignMetrics] Claude Design activity metrics for a single user on a given day.
          #
          #   @param office_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeMetrics] Office Agent activity metrics for a single user on a given day, broken out by Of
          #
          #   @param science_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsScienceMetrics] Claude Science activity metrics for a single user on a given day.
          #
          #   @param web_search_count [Integer] Number of web searches performed
          #
          #   @param chat_cowork_unified_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics, nil] Activity recorded while the member had Chat and Cowork unified (Cowork's feature
          #
          #   @param distinct_user_count [Integer, nil] Number of distinct active users represented by this row. Only set for grouped ro
          #
          #   @param last_activity_date [Date, nil] Most recent UTC day (YYYY-MM-DD) on which the user had any counted activity, wit
          #
          #   @param rbac_group_id [String, nil] Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API s
          #
          #   @param rbac_group_name [String, nil] Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
          #
          #   @param user [Anthropic::Models::Beta::Organization::BetaAnalyticsUser, nil] The user this row describes. Null on rows aggregated across users.

          # @see Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity#chat_cowork_unified_metrics
          class ChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
            # @!attribute chat
            #   Chat activity recorded while members had Chat and Cowork unified turned on.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics]
            required :chat, -> { Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics }

            # @!attribute sessions
            #   Cowork session activity recorded while members had Chat and Cowork unified
            #   turned on.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics]
            required :sessions, -> { Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics }

            # @!method initialize(chat:, sessions:)
            #   Activity recorded while the member had Chat and Cowork unified (Cowork's
            #   features inside claude.ai chat) turned on, split into `chat` (chat activity) and
            #   `sessions` (Cowork activity). Omitted from the response on deployments that do
            #   not offer Chat and Cowork unified.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics}
            #   for more details.
            #
            #   @param chat [Anthropic::Models::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics] Chat activity recorded while members had Chat and Cowork unified turned
            #
            #   @param sessions [Anthropic::Models::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics] Cowork session activity recorded while members had Chat and Cowork
          end
        end
      end
    end
  end
end
