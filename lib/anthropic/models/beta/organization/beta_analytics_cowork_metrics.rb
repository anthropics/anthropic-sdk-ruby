# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsCoworkMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute action_count
          #   Number of tool actions completed in Cowork sessions
          #
          #   @return [Integer]
          required :action_count, Integer

          # @!attribute artifacts_created_count
          #   Number of artifacts created in Cowork sessions: an artifact counts once, on the
          #   day a session first saves it. Counted from 2026-08-17; 0 on earlier days. Exact
          #   in date-range mode: a creation belongs to exactly one day, so the per-day counts
          #   never overlap and their sum over the window is the exact count of distinct
          #   creations in it.
          #
          #   @return [Integer]
          required :artifacts_created_count, Integer

          # @!attribute connectors_used_count
          #   Total number of connector invocations in Cowork sessions
          #
          #   @return [Integer]
          required :connectors_used_count, Integer

          # @!attribute dispatch_turn_count
          #   Number of Dispatch (background agent) turns completed
          #
          #   @return [Integer]
          required :dispatch_turn_count, Integer

          # @!attribute distinct_connectors_used_count
          #   Number of distinct connectors used in Cowork sessions. Approximate (HLL, typical
          #   error <2%) in date-range mode. Null on aggregated rows where a distinct count
          #   cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_connectors_used_count, Integer, nil?: true

          # @!attribute distinct_session_count
          #   Number of distinct Cowork sessions. Approximate (HLL, typical error <2%) in
          #   date-range mode. Null on aggregated rows where a distinct count cannot be
          #   computed.
          #
          #   @return [Integer, nil]
          required :distinct_session_count, Integer, nil?: true

          # @!attribute distinct_skills_used_count
          #   Number of distinct skills used in Cowork sessions. Approximate (HLL, typical
          #   error <2%) in date-range mode. Null on aggregated rows where a distinct count
          #   cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_skills_used_count, Integer, nil?: true

          # @!attribute message_count
          #   Number of messages sent in Cowork sessions
          #
          #   @return [Integer]
          required :message_count, Integer

          # @!attribute skills_used_count
          #   Total number of skill invocations in Cowork sessions
          #
          #   @return [Integer]
          required :skills_used_count, Integer

          # @!attribute distinct_plugins_used_count
          #   Number of distinct plugins used in Cowork sessions. Null while Cowork plugin-use
          #   metrics are not enabled for this organization. Approximate (HLL, typical error
          #   <2%) in date-range mode. Null on aggregated rows where a distinct count cannot
          #   be computed.
          #
          #   @return [Integer, nil]
          optional :distinct_plugins_used_count, Integer, nil?: true

          # @!attribute edit_tool_count
          #   Number of successful Edit tool calls in Cowork sessions. Null while the
          #   file-edit metrics are not enabled for this organization.
          #
          #   @return [Integer, nil]
          optional :edit_tool_count, Integer, nil?: true

          # @!attribute file_edit_count
          #   Number of successful file-edit tool calls (Edit, MultiEdit, Write, NotebookEdit)
          #   in Cowork sessions. Null, never 0, while the file-edit metrics are not enabled
          #   for this organization.
          #
          #   @return [Integer, nil]
          optional :file_edit_count, Integer, nil?: true

          # @!attribute multi_edit_tool_count
          #   Number of successful MultiEdit tool calls in Cowork sessions. Null while the
          #   file-edit metrics are not enabled for this organization.
          #
          #   @return [Integer, nil]
          optional :multi_edit_tool_count, Integer, nil?: true

          # @!attribute notebook_edit_tool_count
          #   Number of successful NotebookEdit tool calls in Cowork sessions. Null while the
          #   file-edit metrics are not enabled for this organization.
          #
          #   @return [Integer, nil]
          optional :notebook_edit_tool_count, Integer, nil?: true

          # @!attribute plugins_used_count
          #   Total number of plugin invocations in Cowork sessions. Null while Cowork
          #   plugin-use metrics are not enabled for this organization.
          #
          #   @return [Integer, nil]
          optional :plugins_used_count, Integer, nil?: true

          # @!attribute sessions_with_file_edits_count
          #   Number of distinct Cowork sessions with at least one successful file-edit tool
          #   call. Null while the file-edit metrics are not enabled for this organization.
          #   Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
          #   where a distinct count cannot be computed.
          #
          #   @return [Integer, nil]
          optional :sessions_with_file_edits_count, Integer, nil?: true

          # @!attribute write_tool_count
          #   Number of successful Write tool calls in Cowork sessions. Null while the
          #   file-edit metrics are not enabled for this organization.
          #
          #   @return [Integer, nil]
          optional :write_tool_count, Integer, nil?: true

          # @!method initialize(action_count:, artifacts_created_count:, connectors_used_count:, dispatch_turn_count:, distinct_connectors_used_count:, distinct_session_count:, distinct_skills_used_count:, message_count:, skills_used_count:, distinct_plugins_used_count: nil, edit_tool_count: nil, file_edit_count: nil, multi_edit_tool_count: nil, notebook_edit_tool_count: nil, plugins_used_count: nil, sessions_with_file_edits_count: nil, write_tool_count: nil)
          #   Cowork activity metrics for a single user on a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsCoworkMetrics} for more
          #   details.
          #
          #   @param action_count [Integer] Number of tool actions completed in Cowork sessions
          #
          #   @param artifacts_created_count [Integer] Number of artifacts created in Cowork sessions: an artifact counts once, on the
          #
          #   @param connectors_used_count [Integer] Total number of connector invocations in Cowork sessions
          #
          #   @param dispatch_turn_count [Integer] Number of Dispatch (background agent) turns completed
          #
          #   @param distinct_connectors_used_count [Integer, nil] Number of distinct connectors used in Cowork sessions. Approximate (HLL, typical
          #
          #   @param distinct_session_count [Integer, nil] Number of distinct Cowork sessions. Approximate (HLL, typical error <2%) in date
          #
          #   @param distinct_skills_used_count [Integer, nil] Number of distinct skills used in Cowork sessions. Approximate (HLL, typical err
          #
          #   @param message_count [Integer] Number of messages sent in Cowork sessions
          #
          #   @param skills_used_count [Integer] Total number of skill invocations in Cowork sessions
          #
          #   @param distinct_plugins_used_count [Integer, nil] Number of distinct plugins used in Cowork sessions. Null while Cowork plugin-use
          #
          #   @param edit_tool_count [Integer, nil] Number of successful Edit tool calls in Cowork sessions. Null while the file-edi
          #
          #   @param file_edit_count [Integer, nil] Number of successful file-edit tool calls (Edit, MultiEdit, Write, NotebookEdit)
          #
          #   @param multi_edit_tool_count [Integer, nil] Number of successful MultiEdit tool calls in Cowork sessions. Null while the fil
          #
          #   @param notebook_edit_tool_count [Integer, nil] Number of successful NotebookEdit tool calls in Cowork sessions. Null while the
          #
          #   @param plugins_used_count [Integer, nil] Total number of plugin invocations in Cowork sessions. Null while Cowork plugin-
          #
          #   @param sessions_with_file_edits_count [Integer, nil] Number of distinct Cowork sessions with at least one successful file-edit tool c
          #
          #   @param write_tool_count [Integer, nil] Number of successful Write tool calls in Cowork sessions. Null while the file-ed
        end
      end
    end
  end
end
