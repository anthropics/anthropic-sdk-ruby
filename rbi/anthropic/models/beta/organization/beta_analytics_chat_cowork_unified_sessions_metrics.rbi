# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsChatCoworkUnifiedSessionsMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Same measure as `cowork_metrics.action_count`, for activity recorded while
          # members had Chat and Cowork unified turned on.
          sig { returns(Integer) }
          attr_accessor :action_count

          # Same measure as `cowork_metrics.artifacts_created_count`, for activity recorded
          # while members had Chat and Cowork unified turned on. Exact in date-range mode: a
          # creation belongs to exactly one day, so the per-day counts never overlap and
          # their sum over the window is the exact count of distinct creations in it.
          sig { returns(Integer) }
          attr_accessor :artifacts_created_count

          # Same measure as `cowork_metrics.connectors_used_count`, for activity recorded
          # while members had Chat and Cowork unified turned on.
          sig { returns(Integer) }
          attr_accessor :connectors_used_count

          # Same measure as `cowork_metrics.dispatch_turn_count`, for activity recorded
          # while members had Chat and Cowork unified turned on.
          sig { returns(Integer) }
          attr_accessor :dispatch_turn_count

          # Same measure as `cowork_metrics.distinct_connectors_used_count`, for activity
          # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
          # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          # count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_connectors_used_count

          # Same measure as `cowork_metrics.distinct_plugins_used_count`, for activity
          # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
          # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          # count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_plugins_used_count

          # Same measure as `cowork_metrics.distinct_session_count`, for activity recorded
          # while members had Chat and Cowork unified turned on. Approximate (HLL, typical
          # error <2%) in date-range mode. Null on aggregated rows where a distinct count
          # cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_session_count

          # Same measure as `cowork_metrics.distinct_skills_used_count`, for activity
          # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
          # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          # count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_skills_used_count

          # Same measure as `cowork_metrics.edit_tool_count`, for activity recorded while
          # members had Chat and Cowork unified turned on.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :edit_tool_count

          # Same measure as `cowork_metrics.file_edit_count`, for activity recorded while
          # members had Chat and Cowork unified turned on.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :file_edit_count

          # Same measure as `cowork_metrics.message_count`, for activity recorded while
          # members had Chat and Cowork unified turned on.
          sig { returns(Integer) }
          attr_accessor :message_count

          # Same measure as `cowork_metrics.multi_edit_tool_count`, for activity recorded
          # while members had Chat and Cowork unified turned on. Claude no longer has a
          # multi-edit tool, so expect 0 when not null; each edit is now a separate Edit
          # tool call, counted in `edit_tool_count` and `file_edit_count`.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :multi_edit_tool_count

          # Same measure as `cowork_metrics.notebook_edit_tool_count`, for activity recorded
          # while members had Chat and Cowork unified turned on.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :notebook_edit_tool_count

          # Same measure as `cowork_metrics.plugins_used_count`, for activity recorded while
          # members had Chat and Cowork unified turned on.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :plugins_used_count

          # Same measure as `cowork_metrics.sessions_with_file_edits_count`, for activity
          # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
          # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          # count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :sessions_with_file_edits_count

          # Same measure as `cowork_metrics.skills_used_count`, for activity recorded while
          # members had Chat and Cowork unified turned on.
          sig { returns(Integer) }
          attr_accessor :skills_used_count

          # Same measure as `cowork_metrics.write_tool_count`, for activity recorded while
          # members had Chat and Cowork unified turned on.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :write_tool_count

          # Cowork session activity recorded while members had Chat and Cowork unified
          # turned on.
          sig do
            params(
              action_count: Integer,
              artifacts_created_count: Integer,
              connectors_used_count: Integer,
              dispatch_turn_count: Integer,
              distinct_connectors_used_count: T.nilable(Integer),
              distinct_plugins_used_count: T.nilable(Integer),
              distinct_session_count: T.nilable(Integer),
              distinct_skills_used_count: T.nilable(Integer),
              edit_tool_count: T.nilable(Integer),
              file_edit_count: T.nilable(Integer),
              message_count: Integer,
              multi_edit_tool_count: T.nilable(Integer),
              notebook_edit_tool_count: T.nilable(Integer),
              plugins_used_count: T.nilable(Integer),
              sessions_with_file_edits_count: T.nilable(Integer),
              skills_used_count: Integer,
              write_tool_count: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # Same measure as `cowork_metrics.action_count`, for activity recorded while
            # members had Chat and Cowork unified turned on.
            action_count:,
            # Same measure as `cowork_metrics.artifacts_created_count`, for activity recorded
            # while members had Chat and Cowork unified turned on. Exact in date-range mode: a
            # creation belongs to exactly one day, so the per-day counts never overlap and
            # their sum over the window is the exact count of distinct creations in it.
            artifacts_created_count:,
            # Same measure as `cowork_metrics.connectors_used_count`, for activity recorded
            # while members had Chat and Cowork unified turned on.
            connectors_used_count:,
            # Same measure as `cowork_metrics.dispatch_turn_count`, for activity recorded
            # while members had Chat and Cowork unified turned on.
            dispatch_turn_count:,
            # Same measure as `cowork_metrics.distinct_connectors_used_count`, for activity
            # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
            # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
            # count cannot be computed.
            distinct_connectors_used_count:,
            # Same measure as `cowork_metrics.distinct_plugins_used_count`, for activity
            # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
            # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
            # count cannot be computed.
            distinct_plugins_used_count:,
            # Same measure as `cowork_metrics.distinct_session_count`, for activity recorded
            # while members had Chat and Cowork unified turned on. Approximate (HLL, typical
            # error <2%) in date-range mode. Null on aggregated rows where a distinct count
            # cannot be computed.
            distinct_session_count:,
            # Same measure as `cowork_metrics.distinct_skills_used_count`, for activity
            # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
            # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
            # count cannot be computed.
            distinct_skills_used_count:,
            # Same measure as `cowork_metrics.edit_tool_count`, for activity recorded while
            # members had Chat and Cowork unified turned on.
            edit_tool_count:,
            # Same measure as `cowork_metrics.file_edit_count`, for activity recorded while
            # members had Chat and Cowork unified turned on.
            file_edit_count:,
            # Same measure as `cowork_metrics.message_count`, for activity recorded while
            # members had Chat and Cowork unified turned on.
            message_count:,
            # Same measure as `cowork_metrics.multi_edit_tool_count`, for activity recorded
            # while members had Chat and Cowork unified turned on. Claude no longer has a
            # multi-edit tool, so expect 0 when not null; each edit is now a separate Edit
            # tool call, counted in `edit_tool_count` and `file_edit_count`.
            multi_edit_tool_count:,
            # Same measure as `cowork_metrics.notebook_edit_tool_count`, for activity recorded
            # while members had Chat and Cowork unified turned on.
            notebook_edit_tool_count:,
            # Same measure as `cowork_metrics.plugins_used_count`, for activity recorded while
            # members had Chat and Cowork unified turned on.
            plugins_used_count:,
            # Same measure as `cowork_metrics.sessions_with_file_edits_count`, for activity
            # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
            # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
            # count cannot be computed.
            sessions_with_file_edits_count:,
            # Same measure as `cowork_metrics.skills_used_count`, for activity recorded while
            # members had Chat and Cowork unified turned on.
            skills_used_count:,
            # Same measure as `cowork_metrics.write_tool_count`, for activity recorded while
            # members had Chat and Cowork unified turned on.
            write_tool_count:
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
                distinct_plugins_used_count: T.nilable(Integer),
                distinct_session_count: T.nilable(Integer),
                distinct_skills_used_count: T.nilable(Integer),
                edit_tool_count: T.nilable(Integer),
                file_edit_count: T.nilable(Integer),
                message_count: Integer,
                multi_edit_tool_count: T.nilable(Integer),
                notebook_edit_tool_count: T.nilable(Integer),
                plugins_used_count: T.nilable(Integer),
                sessions_with_file_edits_count: T.nilable(Integer),
                skills_used_count: Integer,
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
