# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsChatCoworkUnifiedChatMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Same measure as `chat_metrics.connectors_used_count`, for activity recorded
          # while members had Chat and Cowork unified turned on.
          sig { returns(Integer) }
          attr_accessor :connectors_used_count

          # Same measure as `chat_metrics.distinct_artifacts_created_count`, for activity
          # recorded while members had Chat and Cowork unified turned on. Exact in
          # date-range mode: a creation belongs to exactly one day, so the per-day counts
          # never overlap and their sum over the window is the exact count of distinct
          # creations in it.
          sig { returns(Integer) }
          attr_accessor :distinct_artifacts_created_count

          # Same measure as `chat_metrics.distinct_connectors_used_count`, for activity
          # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
          # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          # count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_connectors_used_count

          # Same measure as `chat_metrics.distinct_conversation_count`, for activity
          # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
          # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          # count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_conversation_count

          # Same measure as `chat_metrics.distinct_files_uploaded_count`, for activity
          # recorded while members had Chat and Cowork unified turned on. It counts uploaded
          # files as well as files Claude created and images returned by Claude's tools,
          # such as screenshots. Approximate (HLL, typical error <2%) in date-range mode.
          # Null on aggregated rows where a distinct count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_files_uploaded_count

          # Same measure as `chat_metrics.distinct_projects_created_count`, for activity
          # recorded while members had Chat and Cowork unified turned on. Exact in
          # date-range mode: a creation belongs to exactly one day, so the per-day counts
          # never overlap and their sum over the window is the exact count of distinct
          # creations in it.
          sig { returns(Integer) }
          attr_accessor :distinct_projects_created_count

          # Same measure as `chat_metrics.distinct_projects_used_count`, for activity
          # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
          # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          # count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_projects_used_count

          # Always null: shared-artifact views are not currently measured.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_shared_artifacts_viewed_count

          # Same measure as `chat_metrics.distinct_skills_used_count`, for activity recorded
          # while members had Chat and Cowork unified turned on. Approximate (HLL, typical
          # error <2%) in date-range mode. Null on aggregated rows where a distinct count
          # cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_skills_used_count

          # Same measure as `chat_metrics.message_count`, for activity recorded while
          # members had Chat and Cowork unified turned on.
          sig { returns(Integer) }
          attr_accessor :message_count

          # Same measure as `chat_metrics.shared_conversations_viewed_count`, for activity
          # recorded while members had Chat and Cowork unified turned on.
          sig { returns(Integer) }
          attr_accessor :shared_conversations_viewed_count

          # Same measure as `chat_metrics.thinking_message_count`, for activity recorded
          # while members had Chat and Cowork unified turned on.
          sig { returns(Integer) }
          attr_accessor :thinking_message_count

          # Chat activity recorded while members had Chat and Cowork unified turned on.
          sig do
            params(
              connectors_used_count: Integer,
              distinct_artifacts_created_count: Integer,
              distinct_connectors_used_count: T.nilable(Integer),
              distinct_conversation_count: T.nilable(Integer),
              distinct_files_uploaded_count: T.nilable(Integer),
              distinct_projects_created_count: Integer,
              distinct_projects_used_count: T.nilable(Integer),
              distinct_shared_artifacts_viewed_count: T.nilable(Integer),
              distinct_skills_used_count: T.nilable(Integer),
              message_count: Integer,
              shared_conversations_viewed_count: Integer,
              thinking_message_count: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Same measure as `chat_metrics.connectors_used_count`, for activity recorded
            # while members had Chat and Cowork unified turned on.
            connectors_used_count:,
            # Same measure as `chat_metrics.distinct_artifacts_created_count`, for activity
            # recorded while members had Chat and Cowork unified turned on. Exact in
            # date-range mode: a creation belongs to exactly one day, so the per-day counts
            # never overlap and their sum over the window is the exact count of distinct
            # creations in it.
            distinct_artifacts_created_count:,
            # Same measure as `chat_metrics.distinct_connectors_used_count`, for activity
            # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
            # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
            # count cannot be computed.
            distinct_connectors_used_count:,
            # Same measure as `chat_metrics.distinct_conversation_count`, for activity
            # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
            # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
            # count cannot be computed.
            distinct_conversation_count:,
            # Same measure as `chat_metrics.distinct_files_uploaded_count`, for activity
            # recorded while members had Chat and Cowork unified turned on. It counts uploaded
            # files as well as files Claude created and images returned by Claude's tools,
            # such as screenshots. Approximate (HLL, typical error <2%) in date-range mode.
            # Null on aggregated rows where a distinct count cannot be computed.
            distinct_files_uploaded_count:,
            # Same measure as `chat_metrics.distinct_projects_created_count`, for activity
            # recorded while members had Chat and Cowork unified turned on. Exact in
            # date-range mode: a creation belongs to exactly one day, so the per-day counts
            # never overlap and their sum over the window is the exact count of distinct
            # creations in it.
            distinct_projects_created_count:,
            # Same measure as `chat_metrics.distinct_projects_used_count`, for activity
            # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
            # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
            # count cannot be computed.
            distinct_projects_used_count:,
            # Always null: shared-artifact views are not currently measured.
            distinct_shared_artifacts_viewed_count:,
            # Same measure as `chat_metrics.distinct_skills_used_count`, for activity recorded
            # while members had Chat and Cowork unified turned on. Approximate (HLL, typical
            # error <2%) in date-range mode. Null on aggregated rows where a distinct count
            # cannot be computed.
            distinct_skills_used_count:,
            # Same measure as `chat_metrics.message_count`, for activity recorded while
            # members had Chat and Cowork unified turned on.
            message_count:,
            # Same measure as `chat_metrics.shared_conversations_viewed_count`, for activity
            # recorded while members had Chat and Cowork unified turned on.
            shared_conversations_viewed_count:,
            # Same measure as `chat_metrics.thinking_message_count`, for activity recorded
            # while members had Chat and Cowork unified turned on.
            thinking_message_count:
          )
          end

          sig do
            override.returns(
              {
                connectors_used_count: Integer,
                distinct_artifacts_created_count: Integer,
                distinct_connectors_used_count: T.nilable(Integer),
                distinct_conversation_count: T.nilable(Integer),
                distinct_files_uploaded_count: T.nilable(Integer),
                distinct_projects_created_count: Integer,
                distinct_projects_used_count: T.nilable(Integer),
                distinct_shared_artifacts_viewed_count: T.nilable(Integer),
                distinct_skills_used_count: T.nilable(Integer),
                message_count: Integer,
                shared_conversations_viewed_count: Integer,
                thinking_message_count: Integer
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
