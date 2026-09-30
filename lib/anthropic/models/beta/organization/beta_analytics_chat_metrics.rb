# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsChatMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute connectors_used_count
          #   Number of MCP connector invocations.
          #
          #   @return [Integer]
          required :connectors_used_count, Integer

          # @!attribute distinct_artifacts_created_count
          #   Number of distinct artifacts created. Exact in date-range mode: a creation
          #   belongs to exactly one day, so the per-day counts never overlap and their sum
          #   over the window is the exact count of distinct creations in it.
          #
          #   @return [Integer]
          required :distinct_artifacts_created_count, Integer

          # @!attribute distinct_connectors_used_count
          #   Distinct claude.ai connectors this user used. Excludes calls whose connector
          #   could not be identified and all calls from organizations with zero data
          #   retention. Approximate (HLL, typical error <2%) in date-range mode. Null on
          #   aggregated rows where a distinct count cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_connectors_used_count, Integer, nil?: true

          # @!attribute distinct_conversation_count
          #   Number of distinct conversations the user participated in. Approximate (HLL,
          #   typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          #   count cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_conversation_count, Integer, nil?: true

          # @!attribute distinct_files_uploaded_count
          #   Number of distinct files uploaded. Approximate (HLL, typical error <2%) in
          #   date-range mode. Null on aggregated rows where a distinct count cannot be
          #   computed.
          #
          #   @return [Integer, nil]
          required :distinct_files_uploaded_count, Integer, nil?: true

          # @!attribute distinct_projects_created_count
          #   Number of distinct projects created. Exact in date-range mode: a creation
          #   belongs to exactly one day, so the per-day counts never overlap and their sum
          #   over the window is the exact count of distinct creations in it.
          #
          #   @return [Integer]
          required :distinct_projects_created_count, Integer

          # @!attribute distinct_projects_used_count
          #   Number of distinct projects used. Approximate (HLL, typical error <2%) in
          #   date-range mode. Null on aggregated rows where a distinct count cannot be
          #   computed.
          #
          #   @return [Integer, nil]
          required :distinct_projects_used_count, Integer, nil?: true

          # @!attribute distinct_shared_artifacts_viewed_count
          #   Number of distinct shared artifacts the user viewed. Approximate (HLL, typical
          #   error <2%) in date-range mode. Null on aggregated rows where a distinct count
          #   cannot be computed.
          #
          #   @return [Integer, nil]
          required :distinct_shared_artifacts_viewed_count, Integer, nil?: true

          # @!attribute distinct_skills_used_count
          #   Number of distinct skills used. Approximate (HLL, typical error <2%) in
          #   date-range mode. Null on aggregated rows where a distinct count cannot be
          #   computed.
          #
          #   @return [Integer, nil]
          required :distinct_skills_used_count, Integer, nil?: true

          # @!attribute message_count
          #   Number of messages sent
          #
          #   @return [Integer]
          required :message_count, Integer

          # @!attribute shared_conversations_viewed_count
          #   Number of times the user opened a shared conversation in a project
          #
          #   @return [Integer]
          required :shared_conversations_viewed_count, Integer

          # @!attribute thinking_message_count
          #   Number of messages that used extended thinking
          #
          #   @return [Integer]
          required :thinking_message_count, Integer

          # @!method initialize(connectors_used_count:, distinct_artifacts_created_count:, distinct_connectors_used_count:, distinct_conversation_count:, distinct_files_uploaded_count:, distinct_projects_created_count:, distinct_projects_used_count:, distinct_shared_artifacts_viewed_count:, distinct_skills_used_count:, message_count:, shared_conversations_viewed_count:, thinking_message_count:)
          #   Claude.ai activity metrics for a single user on a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsChatMetrics} for more
          #   details.
          #
          #   @param connectors_used_count [Integer] Number of MCP connector invocations.
          #
          #   @param distinct_artifacts_created_count [Integer] Number of distinct artifacts created. Exact in date-range mode: a creation belon
          #
          #   @param distinct_connectors_used_count [Integer, nil] Distinct claude.ai connectors this user used. Excludes calls whose connector cou
          #
          #   @param distinct_conversation_count [Integer, nil] Number of distinct conversations the user participated in. Approximate (HLL, typ
          #
          #   @param distinct_files_uploaded_count [Integer, nil] Number of distinct files uploaded. Approximate (HLL, typical error <2%) in date-
          #
          #   @param distinct_projects_created_count [Integer] Number of distinct projects created. Exact in date-range mode: a creation belong
          #
          #   @param distinct_projects_used_count [Integer, nil] Number of distinct projects used. Approximate (HLL, typical error <2%) in date-r
          #
          #   @param distinct_shared_artifacts_viewed_count [Integer, nil] Number of distinct shared artifacts the user viewed. Approximate (HLL, typical e
          #
          #   @param distinct_skills_used_count [Integer, nil] Number of distinct skills used. Approximate (HLL, typical error <2%) in date-ran
          #
          #   @param message_count [Integer] Number of messages sent
          #
          #   @param shared_conversations_viewed_count [Integer] Number of times the user opened a shared conversation in a project
          #
          #   @param thinking_message_count [Integer] Number of messages that used extended thinking
        end
      end
    end
  end
end
