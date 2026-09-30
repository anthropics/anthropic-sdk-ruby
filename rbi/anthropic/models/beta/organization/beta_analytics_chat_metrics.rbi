# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsChatMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsChatMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of MCP connector invocations.
          sig { returns(Integer) }
          attr_accessor :connectors_used_count

          # Number of distinct artifacts created. Exact in date-range mode: a creation
          # belongs to exactly one day, so the per-day counts never overlap and their sum
          # over the window is the exact count of distinct creations in it.
          sig { returns(Integer) }
          attr_accessor :distinct_artifacts_created_count

          # Distinct claude.ai connectors this user used. Excludes calls whose connector
          # could not be identified and all calls from organizations with zero data
          # retention. Approximate (HLL, typical error <2%) in date-range mode. Null on
          # aggregated rows where a distinct count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_connectors_used_count

          # Number of distinct conversations the user participated in. Approximate (HLL,
          # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          # count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_conversation_count

          # Number of distinct files uploaded. Approximate (HLL, typical error <2%) in
          # date-range mode. Null on aggregated rows where a distinct count cannot be
          # computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_files_uploaded_count

          # Number of distinct projects created. Exact in date-range mode: a creation
          # belongs to exactly one day, so the per-day counts never overlap and their sum
          # over the window is the exact count of distinct creations in it.
          sig { returns(Integer) }
          attr_accessor :distinct_projects_created_count

          # Number of distinct projects used. Approximate (HLL, typical error <2%) in
          # date-range mode. Null on aggregated rows where a distinct count cannot be
          # computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_projects_used_count

          # Number of distinct shared artifacts the user viewed. Approximate (HLL, typical
          # error <2%) in date-range mode. Null on aggregated rows where a distinct count
          # cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_shared_artifacts_viewed_count

          # Number of distinct skills used. Approximate (HLL, typical error <2%) in
          # date-range mode. Null on aggregated rows where a distinct count cannot be
          # computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_skills_used_count

          # Number of messages sent
          sig { returns(Integer) }
          attr_accessor :message_count

          # Number of times the user opened a shared conversation in a project
          sig { returns(Integer) }
          attr_accessor :shared_conversations_viewed_count

          # Number of messages that used extended thinking
          sig { returns(Integer) }
          attr_accessor :thinking_message_count

          # Claude.ai activity metrics for a single user on a given day.
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
            # Number of MCP connector invocations.
            connectors_used_count:,
            # Number of distinct artifacts created. Exact in date-range mode: a creation
            # belongs to exactly one day, so the per-day counts never overlap and their sum
            # over the window is the exact count of distinct creations in it.
            distinct_artifacts_created_count:,
            # Distinct claude.ai connectors this user used. Excludes calls whose connector
            # could not be identified and all calls from organizations with zero data
            # retention. Approximate (HLL, typical error <2%) in date-range mode. Null on
            # aggregated rows where a distinct count cannot be computed.
            distinct_connectors_used_count:,
            # Number of distinct conversations the user participated in. Approximate (HLL,
            # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
            # count cannot be computed.
            distinct_conversation_count:,
            # Number of distinct files uploaded. Approximate (HLL, typical error <2%) in
            # date-range mode. Null on aggregated rows where a distinct count cannot be
            # computed.
            distinct_files_uploaded_count:,
            # Number of distinct projects created. Exact in date-range mode: a creation
            # belongs to exactly one day, so the per-day counts never overlap and their sum
            # over the window is the exact count of distinct creations in it.
            distinct_projects_created_count:,
            # Number of distinct projects used. Approximate (HLL, typical error <2%) in
            # date-range mode. Null on aggregated rows where a distinct count cannot be
            # computed.
            distinct_projects_used_count:,
            # Number of distinct shared artifacts the user viewed. Approximate (HLL, typical
            # error <2%) in date-range mode. Null on aggregated rows where a distinct count
            # cannot be computed.
            distinct_shared_artifacts_viewed_count:,
            # Number of distinct skills used. Approximate (HLL, typical error <2%) in
            # date-range mode. Null on aggregated rows where a distinct count cannot be
            # computed.
            distinct_skills_used_count:,
            # Number of messages sent
            message_count:,
            # Number of times the user opened a shared conversation in a project
            shared_conversations_viewed_count:,
            # Number of messages that used extended thinking
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
