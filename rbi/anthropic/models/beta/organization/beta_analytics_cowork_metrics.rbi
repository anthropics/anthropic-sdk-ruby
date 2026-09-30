# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsCoworkMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsCoworkMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of tool actions completed in Cowork sessions
          sig { returns(Integer) }
          attr_accessor :action_count

          # Number of artifacts created in Cowork sessions: an artifact counts once, on the
          # day a session first saves it. Counted from 2026-08-17; 0 on earlier days. Exact
          # in date-range mode: a creation belongs to exactly one day, so the per-day counts
          # never overlap and their sum over the window is the exact count of distinct
          # creations in it.
          sig { returns(Integer) }
          attr_accessor :artifacts_created_count

          # Total number of connector invocations in Cowork sessions
          sig { returns(Integer) }
          attr_accessor :connectors_used_count

          # Number of Dispatch (background agent) turns completed
          sig { returns(Integer) }
          attr_accessor :dispatch_turn_count

          # Number of distinct connectors used in Cowork sessions. Approximate (HLL, typical
          # error <2%) in date-range mode. Null on aggregated rows where a distinct count
          # cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_connectors_used_count

          # Number of distinct Cowork sessions. Approximate (HLL, typical error <2%) in
          # date-range mode. Null on aggregated rows where a distinct count cannot be
          # computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_session_count

          # Number of distinct skills used in Cowork sessions. Approximate (HLL, typical
          # error <2%) in date-range mode. Null on aggregated rows where a distinct count
          # cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_skills_used_count

          # Number of messages sent in Cowork sessions
          sig { returns(Integer) }
          attr_accessor :message_count

          # Total number of skill invocations in Cowork sessions
          sig { returns(Integer) }
          attr_accessor :skills_used_count

          # Number of distinct plugins used in Cowork sessions. Null while Cowork plugin-use
          # metrics are not enabled for this organization. Approximate (HLL, typical error
          # <2%) in date-range mode. Null on aggregated rows where a distinct count cannot
          # be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_plugins_used_count

          # Number of successful Edit tool calls in Cowork sessions. Null while the
          # file-edit metrics are not enabled for this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :edit_tool_count

          # Number of successful file-edit tool calls (Edit, MultiEdit, Write, NotebookEdit)
          # in Cowork sessions. Null, never 0, while the file-edit metrics are not enabled
          # for this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :file_edit_count

          # Number of successful MultiEdit tool calls in Cowork sessions. Null while the
          # file-edit metrics are not enabled for this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :multi_edit_tool_count

          # Number of successful NotebookEdit tool calls in Cowork sessions. Null while the
          # file-edit metrics are not enabled for this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :notebook_edit_tool_count

          # Total number of plugin invocations in Cowork sessions. Null while Cowork
          # plugin-use metrics are not enabled for this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :plugins_used_count

          # Number of distinct Cowork sessions with at least one successful file-edit tool
          # call. Null while the file-edit metrics are not enabled for this organization.
          # Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
          # where a distinct count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :sessions_with_file_edits_count

          # Number of successful Write tool calls in Cowork sessions. Null while the
          # file-edit metrics are not enabled for this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :write_tool_count

          # Cowork activity metrics for a single user on a given day.
          sig do
            params(
              action_count: Integer,
              artifacts_created_count: Integer,
              connectors_used_count: Integer,
              dispatch_turn_count: Integer,
              distinct_connectors_used_count: T.nilable(Integer),
              distinct_session_count: T.nilable(Integer),
              distinct_skills_used_count: T.nilable(Integer),
              message_count: Integer,
              skills_used_count: Integer,
              distinct_plugins_used_count: T.nilable(Integer),
              edit_tool_count: T.nilable(Integer),
              file_edit_count: T.nilable(Integer),
              multi_edit_tool_count: T.nilable(Integer),
              notebook_edit_tool_count: T.nilable(Integer),
              plugins_used_count: T.nilable(Integer),
              sessions_with_file_edits_count: T.nilable(Integer),
              write_tool_count: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of tool actions completed in Cowork sessions
            action_count:,
            # Number of artifacts created in Cowork sessions: an artifact counts once, on the
            # day a session first saves it. Counted from 2026-08-17; 0 on earlier days. Exact
            # in date-range mode: a creation belongs to exactly one day, so the per-day counts
            # never overlap and their sum over the window is the exact count of distinct
            # creations in it.
            artifacts_created_count:,
            # Total number of connector invocations in Cowork sessions
            connectors_used_count:,
            # Number of Dispatch (background agent) turns completed
            dispatch_turn_count:,
            # Number of distinct connectors used in Cowork sessions. Approximate (HLL, typical
            # error <2%) in date-range mode. Null on aggregated rows where a distinct count
            # cannot be computed.
            distinct_connectors_used_count:,
            # Number of distinct Cowork sessions. Approximate (HLL, typical error <2%) in
            # date-range mode. Null on aggregated rows where a distinct count cannot be
            # computed.
            distinct_session_count:,
            # Number of distinct skills used in Cowork sessions. Approximate (HLL, typical
            # error <2%) in date-range mode. Null on aggregated rows where a distinct count
            # cannot be computed.
            distinct_skills_used_count:,
            # Number of messages sent in Cowork sessions
            message_count:,
            # Total number of skill invocations in Cowork sessions
            skills_used_count:,
            # Number of distinct plugins used in Cowork sessions. Null while Cowork plugin-use
            # metrics are not enabled for this organization. Approximate (HLL, typical error
            # <2%) in date-range mode. Null on aggregated rows where a distinct count cannot
            # be computed.
            distinct_plugins_used_count: nil,
            # Number of successful Edit tool calls in Cowork sessions. Null while the
            # file-edit metrics are not enabled for this organization.
            edit_tool_count: nil,
            # Number of successful file-edit tool calls (Edit, MultiEdit, Write, NotebookEdit)
            # in Cowork sessions. Null, never 0, while the file-edit metrics are not enabled
            # for this organization.
            file_edit_count: nil,
            # Number of successful MultiEdit tool calls in Cowork sessions. Null while the
            # file-edit metrics are not enabled for this organization.
            multi_edit_tool_count: nil,
            # Number of successful NotebookEdit tool calls in Cowork sessions. Null while the
            # file-edit metrics are not enabled for this organization.
            notebook_edit_tool_count: nil,
            # Total number of plugin invocations in Cowork sessions. Null while Cowork
            # plugin-use metrics are not enabled for this organization.
            plugins_used_count: nil,
            # Number of distinct Cowork sessions with at least one successful file-edit tool
            # call. Null while the file-edit metrics are not enabled for this organization.
            # Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
            # where a distinct count cannot be computed.
            sessions_with_file_edits_count: nil,
            # Number of successful Write tool calls in Cowork sessions. Null while the
            # file-edit metrics are not enabled for this organization.
            write_tool_count: nil
          )
          end

          sig do
            override.returns(
              {
                action_count: Integer,
                artifacts_created_count: Integer,
                connectors_used_count: Integer,
                dispatch_turn_count: Integer,
                distinct_connectors_used_count: T.nilable(Integer),
                distinct_session_count: T.nilable(Integer),
                distinct_skills_used_count: T.nilable(Integer),
                message_count: Integer,
                skills_used_count: Integer,
                distinct_plugins_used_count: T.nilable(Integer),
                edit_tool_count: T.nilable(Integer),
                file_edit_count: T.nilable(Integer),
                multi_edit_tool_count: T.nilable(Integer),
                notebook_edit_tool_count: T.nilable(Integer),
                plugins_used_count: T.nilable(Integer),
                sessions_with_file_edits_count: T.nilable(Integer),
                write_tool_count: T.nilable(Integer)
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
