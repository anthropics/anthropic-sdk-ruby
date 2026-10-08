# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsChatCoworkUnifiedSessionsMetrics < Anthropic::Internal::Type::BaseModel
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

          # @!attribute distinct_plugins_used_count
          #   Same measure as `cowork_metrics.distinct_plugins_used_count`, for activity
          #   recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
          #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          #   count cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_plugins_used_count, Integer, nil?: true

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

          # @!attribute edit_tool_count
          #   Same measure as `cowork_metrics.edit_tool_count`, for activity recorded while
          #   members had Chat and Cowork unified turned on.
          #
          #   @return [Integer, nil]
          required :edit_tool_count, Integer, nil?: true

          # @!attribute file_edit_count
          #   Same measure as `cowork_metrics.file_edit_count`, for activity recorded while
          #   members had Chat and Cowork unified turned on.
          #
          #   @return [Integer, nil]
          required :file_edit_count, Integer, nil?: true

          # @!attribute message_count
          #   Same measure as `cowork_metrics.message_count`, for activity recorded while
          #   members had Chat and Cowork unified turned on.
          #
          #   @return [Integer]
          required :message_count, Integer

          # @!attribute multi_edit_tool_count
          #   Same measure as `cowork_metrics.multi_edit_tool_count`, for activity recorded
          #   while members had Chat and Cowork unified turned on. Claude no longer has a
          #   multi-edit tool, so expect 0 when not null; each edit is now a separate Edit
          #   tool call, counted in `edit_tool_count` and `file_edit_count`.
          #
          #   @return [Integer, nil]
          required :multi_edit_tool_count, Integer, nil?: true

          # @!attribute notebook_edit_tool_count
          #   Same measure as `cowork_metrics.notebook_edit_tool_count`, for activity recorded
          #   while members had Chat and Cowork unified turned on.
          #
          #   @return [Integer, nil]
          required :notebook_edit_tool_count, Integer, nil?: true

          # @!attribute plugins_used_count
          #   Same measure as `cowork_metrics.plugins_used_count`, for activity recorded while
          #   members had Chat and Cowork unified turned on.
          #
          #   @return [Integer, nil]
          required :plugins_used_count, Integer, nil?: true

          # @!attribute sessions_with_file_edits_count
          #   Same measure as `cowork_metrics.sessions_with_file_edits_count`, for activity
          #   recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
          #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          #   count cannot be computed.
          #
          #   @return [Integer, nil]
          required :sessions_with_file_edits_count, Integer, nil?: true

          # @!attribute skills_used_count
          #   Same measure as `cowork_metrics.skills_used_count`, for activity recorded while
          #   members had Chat and Cowork unified turned on.
          #
          #   @return [Integer]
          required :skills_used_count, Integer

          # @!attribute write_tool_count
          #   Same measure as `cowork_metrics.write_tool_count`, for activity recorded while
          #   members had Chat and Cowork unified turned on.
          #
          #   @return [Integer, nil]
          required :write_tool_count, Integer, nil?: true

          # @!method initialize(action_count:, artifacts_created_count:, connectors_used_count:, dispatch_turn_count:, distinct_connectors_used_count:, distinct_plugins_used_count:, distinct_session_count:, distinct_skills_used_count:, edit_tool_count:, file_edit_count:, message_count:, multi_edit_tool_count:, notebook_edit_tool_count:, plugins_used_count:, sessions_with_file_edits_count:, skills_used_count:, write_tool_count:)
          #   Cowork session activity recorded while members had Chat and Cowork unified
          #   turned on.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics}
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
          #   @param distinct_plugins_used_count [Integer, nil] Same measure as `cowork_metrics.distinct_plugins_used_count`, for activity recor
          #
          #   @param distinct_session_count [Integer, nil] Same measure as `cowork_metrics.distinct_session_count`, for activity recorded w
          #
          #   @param distinct_skills_used_count [Integer, nil] Same measure as `cowork_metrics.distinct_skills_used_count`, for activity record
          #
          #   @param edit_tool_count [Integer, nil] Same measure as `cowork_metrics.edit_tool_count`, for activity recorded while me
          #
          #   @param file_edit_count [Integer, nil] Same measure as `cowork_metrics.file_edit_count`, for activity recorded while me
          #
          #   @param message_count [Integer] Same measure as `cowork_metrics.message_count`, for activity recorded while memb
          #
          #   @param multi_edit_tool_count [Integer, nil] Same measure as `cowork_metrics.multi_edit_tool_count`, for activity recorded wh
          #
          #   @param notebook_edit_tool_count [Integer, nil] Same measure as `cowork_metrics.notebook_edit_tool_count`, for activity recorded
          #
          #   @param plugins_used_count [Integer, nil] Same measure as `cowork_metrics.plugins_used_count`, for activity recorded while
          #
          #   @param sessions_with_file_edits_count [Integer, nil] Same measure as `cowork_metrics.sessions_with_file_edits_count`, for activity re
          #
          #   @param skills_used_count [Integer] Same measure as `cowork_metrics.skills_used_count`, for activity recorded while
          #
          #   @param write_tool_count [Integer, nil] Same measure as `cowork_metrics.write_tool_count`, for activity recorded while m
        end
      end
    end
  end
end
