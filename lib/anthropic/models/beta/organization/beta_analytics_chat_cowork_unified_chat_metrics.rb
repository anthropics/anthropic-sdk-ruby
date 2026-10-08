# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsChatCoworkUnifiedChatMetrics < Anthropic::Internal::Type::BaseModel
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
          #   recorded while members had Chat and Cowork unified turned on. It counts uploaded
          #   files as well as files Claude created and images returned by Claude's tools,
          #   such as screenshots. Approximate (HLL, typical error <2%) in date-range mode.
          #   Null on aggregated rows where a distinct count cannot be computed.
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
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics}
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
      end
    end
  end
end
