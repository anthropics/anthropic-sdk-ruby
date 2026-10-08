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
            #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Chat]
            required :chat,
                     -> { Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Chat }

            # @!attribute sessions
            #   Cowork session activity recorded while members had Chat and Cowork unified
            #   turned on.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Sessions]
            required :sessions,
                     -> { Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Sessions }

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
            #   @param chat [Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Chat] Chat activity recorded while members had Chat and Cowork unified turned
            #
            #   @param sessions [Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Sessions] Cowork session activity recorded while members had Chat and Cowork

            # @see Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics#chat
            class Chat < Anthropic::Internal::Type::BaseModel
              # @!attribute connectors_used_count
              #   Same measure as `chat_metrics.connectors_used_count`, for activity recorded
              #   while members had Chat and Cowork unified turned on.
              #
              #   @return [Integer]
              required :connectors_used_count, Integer

              # @!attribute distinct_artifacts_created_count
              #   Same measure as `chat_metrics.distinct_artifacts_created_count`, for activity
              #   recorded while members had Chat and Cowork unified turned on. Exact in
              #   date-range mode: a creation belongs to exactly one day, so the per-day counts
              #   never overlap and their sum over the window is the exact count of distinct
              #   creations in it.
              #
              #   @return [Integer]
              required :distinct_artifacts_created_count, Integer

              # @!attribute distinct_connectors_used_count
              #   Same measure as `chat_metrics.distinct_connectors_used_count`, for activity
              #   recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              #   count cannot be computed.
              #
              #   @return [Integer, nil]
              required :distinct_connectors_used_count, Integer, nil?: true

              # @!attribute distinct_conversation_count
              #   Same measure as `chat_metrics.distinct_conversation_count`, for activity
              #   recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              #   count cannot be computed.
              #
              #   @return [Integer, nil]
              required :distinct_conversation_count, Integer, nil?: true

              # @!attribute distinct_files_uploaded_count
              #   Same measure as `chat_metrics.distinct_files_uploaded_count`, for activity
              #   recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              #   count cannot be computed.
              #
              #   @return [Integer, nil]
              required :distinct_files_uploaded_count, Integer, nil?: true

              # @!attribute distinct_projects_created_count
              #   Same measure as `chat_metrics.distinct_projects_created_count`, for activity
              #   recorded while members had Chat and Cowork unified turned on. Exact in
              #   date-range mode: a creation belongs to exactly one day, so the per-day counts
              #   never overlap and their sum over the window is the exact count of distinct
              #   creations in it.
              #
              #   @return [Integer]
              required :distinct_projects_created_count, Integer

              # @!attribute distinct_projects_used_count
              #   Same measure as `chat_metrics.distinct_projects_used_count`, for activity
              #   recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              #   count cannot be computed.
              #
              #   @return [Integer, nil]
              required :distinct_projects_used_count, Integer, nil?: true

              # @!attribute distinct_shared_artifacts_viewed_count
              #   Always null: shared-artifact views are not currently measured.
              #
              #   @return [Integer, nil]
              required :distinct_shared_artifacts_viewed_count, Integer, nil?: true

              # @!attribute distinct_skills_used_count
              #   Same measure as `chat_metrics.distinct_skills_used_count`, for activity recorded
              #   while members had Chat and Cowork unified turned on. Approximate (HLL, typical
              #   error <2%) in date-range mode. Null on aggregated rows where a distinct count
              #   cannot be computed.
              #
              #   @return [Integer, nil]
              required :distinct_skills_used_count, Integer, nil?: true

              # @!attribute message_count
              #   Same measure as `chat_metrics.message_count`, for activity recorded while
              #   members had Chat and Cowork unified turned on.
              #
              #   @return [Integer]
              required :message_count, Integer

              # @!attribute shared_conversations_viewed_count
              #   Same measure as `chat_metrics.shared_conversations_viewed_count`, for activity
              #   recorded while members had Chat and Cowork unified turned on.
              #
              #   @return [Integer]
              required :shared_conversations_viewed_count, Integer

              # @!attribute thinking_message_count
              #   Same measure as `chat_metrics.thinking_message_count`, for activity recorded
              #   while members had Chat and Cowork unified turned on.
              #
              #   @return [Integer]
              required :thinking_message_count, Integer

              # @!method initialize(connectors_used_count:, distinct_artifacts_created_count:, distinct_connectors_used_count:, distinct_conversation_count:, distinct_files_uploaded_count:, distinct_projects_created_count:, distinct_projects_used_count:, distinct_shared_artifacts_viewed_count:, distinct_skills_used_count:, message_count:, shared_conversations_viewed_count:, thinking_message_count:)
              #   Chat activity recorded while members had Chat and Cowork unified turned on.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Chat}
              #   for more details.
              #
              #   @param connectors_used_count [Integer] Same measure as `chat_metrics.connectors_used_count`, for activity recorded whil
              #
              #   @param distinct_artifacts_created_count [Integer] Same measure as `chat_metrics.distinct_artifacts_created_count`, for activity re
              #
              #   @param distinct_connectors_used_count [Integer, nil] Same measure as `chat_metrics.distinct_connectors_used_count`, for activity reco
              #
              #   @param distinct_conversation_count [Integer, nil] Same measure as `chat_metrics.distinct_conversation_count`, for activity recorde
              #
              #   @param distinct_files_uploaded_count [Integer, nil] Same measure as `chat_metrics.distinct_files_uploaded_count`, for activity recor
              #
              #   @param distinct_projects_created_count [Integer] Same measure as `chat_metrics.distinct_projects_created_count`, for activity rec
              #
              #   @param distinct_projects_used_count [Integer, nil] Same measure as `chat_metrics.distinct_projects_used_count`, for activity record
              #
              #   @param distinct_shared_artifacts_viewed_count [Integer, nil] Always null: shared-artifact views are not currently measured.
              #
              #   @param distinct_skills_used_count [Integer, nil] Same measure as `chat_metrics.distinct_skills_used_count`, for activity recorded
              #
              #   @param message_count [Integer] Same measure as `chat_metrics.message_count`, for activity recorded while member
              #
              #   @param shared_conversations_viewed_count [Integer] Same measure as `chat_metrics.shared_conversations_viewed_count`, for activity r
              #
              #   @param thinking_message_count [Integer] Same measure as `chat_metrics.thinking_message_count`, for activity recorded whi
            end

            # @see Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics#sessions
            class Sessions < Anthropic::Internal::Type::BaseModel
              # @!attribute action_count
              #   Same measure as `cowork_metrics.action_count`, for activity recorded while
              #   members had Chat and Cowork unified turned on.
              #
              #   @return [Integer]
              required :action_count, Integer

              # @!attribute artifacts_created_count
              #   Same measure as `cowork_metrics.artifacts_created_count`, for activity recorded
              #   while members had Chat and Cowork unified turned on. Exact in date-range mode: a
              #   creation belongs to exactly one day, so the per-day counts never overlap and
              #   their sum over the window is the exact count of distinct creations in it.
              #
              #   @return [Integer]
              required :artifacts_created_count, Integer

              # @!attribute connectors_used_count
              #   Same measure as `cowork_metrics.connectors_used_count`, for activity recorded
              #   while members had Chat and Cowork unified turned on.
              #
              #   @return [Integer]
              required :connectors_used_count, Integer

              # @!attribute dispatch_turn_count
              #   Same measure as `cowork_metrics.dispatch_turn_count`, for activity recorded
              #   while members had Chat and Cowork unified turned on.
              #
              #   @return [Integer]
              required :dispatch_turn_count, Integer

              # @!attribute distinct_connectors_used_count
              #   Same measure as `cowork_metrics.distinct_connectors_used_count`, for activity
              #   recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              #   count cannot be computed.
              #
              #   @return [Integer, nil]
              required :distinct_connectors_used_count, Integer, nil?: true

              # @!attribute distinct_session_count
              #   Same measure as `cowork_metrics.distinct_session_count`, for activity recorded
              #   while members had Chat and Cowork unified turned on. Approximate (HLL, typical
              #   error <2%) in date-range mode. Null on aggregated rows where a distinct count
              #   cannot be computed.
              #
              #   @return [Integer, nil]
              required :distinct_session_count, Integer, nil?: true

              # @!attribute distinct_skills_used_count
              #   Same measure as `cowork_metrics.distinct_skills_used_count`, for activity
              #   recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              #   count cannot be computed.
              #
              #   @return [Integer, nil]
              required :distinct_skills_used_count, Integer, nil?: true

              # @!attribute message_count
              #   Same measure as `cowork_metrics.message_count`, for activity recorded while
              #   members had Chat and Cowork unified turned on.
              #
              #   @return [Integer]
              required :message_count, Integer

              # @!attribute skills_used_count
              #   Same measure as `cowork_metrics.skills_used_count`, for activity recorded while
              #   members had Chat and Cowork unified turned on.
              #
              #   @return [Integer]
              required :skills_used_count, Integer

              # @!attribute distinct_plugins_used_count
              #   Same measure as `cowork_metrics.distinct_plugins_used_count`, for activity
              #   recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              #   count cannot be computed.
              #
              #   @return [Integer, nil]
              optional :distinct_plugins_used_count, Integer, nil?: true

              # @!attribute edit_tool_count
              #   Same measure as `cowork_metrics.edit_tool_count`, for activity recorded while
              #   members had Chat and Cowork unified turned on.
              #
              #   @return [Integer, nil]
              optional :edit_tool_count, Integer, nil?: true

              # @!attribute file_edit_count
              #   Same measure as `cowork_metrics.file_edit_count`, for activity recorded while
              #   members had Chat and Cowork unified turned on.
              #
              #   @return [Integer, nil]
              optional :file_edit_count, Integer, nil?: true

              # @!attribute multi_edit_tool_count
              #   Same measure as `cowork_metrics.multi_edit_tool_count`, for activity recorded
              #   while members had Chat and Cowork unified turned on.
              #
              #   @return [Integer, nil]
              optional :multi_edit_tool_count, Integer, nil?: true

              # @!attribute notebook_edit_tool_count
              #   Same measure as `cowork_metrics.notebook_edit_tool_count`, for activity recorded
              #   while members had Chat and Cowork unified turned on.
              #
              #   @return [Integer, nil]
              optional :notebook_edit_tool_count, Integer, nil?: true

              # @!attribute plugins_used_count
              #   Same measure as `cowork_metrics.plugins_used_count`, for activity recorded while
              #   members had Chat and Cowork unified turned on.
              #
              #   @return [Integer, nil]
              optional :plugins_used_count, Integer, nil?: true

              # @!attribute sessions_with_file_edits_count
              #   Same measure as `cowork_metrics.sessions_with_file_edits_count`, for activity
              #   recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              #   count cannot be computed.
              #
              #   @return [Integer, nil]
              optional :sessions_with_file_edits_count, Integer, nil?: true

              # @!attribute write_tool_count
              #   Same measure as `cowork_metrics.write_tool_count`, for activity recorded while
              #   members had Chat and Cowork unified turned on.
              #
              #   @return [Integer, nil]
              optional :write_tool_count, Integer, nil?: true

              # @!method initialize(action_count:, artifacts_created_count:, connectors_used_count:, dispatch_turn_count:, distinct_connectors_used_count:, distinct_session_count:, distinct_skills_used_count:, message_count:, skills_used_count:, distinct_plugins_used_count: nil, edit_tool_count: nil, file_edit_count: nil, multi_edit_tool_count: nil, notebook_edit_tool_count: nil, plugins_used_count: nil, sessions_with_file_edits_count: nil, write_tool_count: nil)
              #   Cowork session activity recorded while members had Chat and Cowork unified
              #   turned on.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Sessions}
              #   for more details.
              #
              #   @param action_count [Integer] Same measure as `cowork_metrics.action_count`, for activity recorded while membe
              #
              #   @param artifacts_created_count [Integer] Same measure as `cowork_metrics.artifacts_created_count`, for activity recorded
              #
              #   @param connectors_used_count [Integer] Same measure as `cowork_metrics.connectors_used_count`, for activity recorded wh
              #
              #   @param dispatch_turn_count [Integer] Same measure as `cowork_metrics.dispatch_turn_count`, for activity recorded whil
              #
              #   @param distinct_connectors_used_count [Integer, nil] Same measure as `cowork_metrics.distinct_connectors_used_count`, for activity re
              #
              #   @param distinct_session_count [Integer, nil] Same measure as `cowork_metrics.distinct_session_count`, for activity recorded w
              #
              #   @param distinct_skills_used_count [Integer, nil] Same measure as `cowork_metrics.distinct_skills_used_count`, for activity record
              #
              #   @param message_count [Integer] Same measure as `cowork_metrics.message_count`, for activity recorded while memb
              #
              #   @param skills_used_count [Integer] Same measure as `cowork_metrics.skills_used_count`, for activity recorded while
              #
              #   @param distinct_plugins_used_count [Integer, nil] Same measure as `cowork_metrics.distinct_plugins_used_count`, for activity recor
              #
              #   @param edit_tool_count [Integer, nil] Same measure as `cowork_metrics.edit_tool_count`, for activity recorded while me
              #
              #   @param file_edit_count [Integer, nil] Same measure as `cowork_metrics.file_edit_count`, for activity recorded while me
              #
              #   @param multi_edit_tool_count [Integer, nil] Same measure as `cowork_metrics.multi_edit_tool_count`, for activity recorded wh
              #
              #   @param notebook_edit_tool_count [Integer, nil] Same measure as `cowork_metrics.notebook_edit_tool_count`, for activity recorded
              #
              #   @param plugins_used_count [Integer, nil] Same measure as `cowork_metrics.plugins_used_count`, for activity recorded while
              #
              #   @param sessions_with_file_edits_count [Integer, nil] Same measure as `cowork_metrics.sessions_with_file_edits_count`, for activity re
              #
              #   @param write_tool_count [Integer, nil] Same measure as `cowork_metrics.write_tool_count`, for activity recorded while m
            end
          end
        end
      end
    end
  end
end
