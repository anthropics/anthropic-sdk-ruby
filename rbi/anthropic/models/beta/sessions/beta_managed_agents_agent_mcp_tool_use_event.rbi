# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentMCPToolUseEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Input parameters for the tool call.
          sig { returns(T::Hash[Symbol, T.anything]) }
          attr_accessor :input

          # Name of the MCP server providing the tool.
          sig { returns(String) }
          attr_accessor :mcp_server_name

          # Name of the MCP tool being used.
          sig { returns(String) }
          attr_accessor :name

          # Timestamp when this event was processed.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The evaluated permission policy for this tool invocation.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission::TaggedSymbol
              )
            )
          end
          attr_reader :evaluated_permission

          sig do
            params(
              evaluated_permission:
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission::OrSymbol
            ).void
          end
          attr_writer :evaluated_permission

          # Which resolved permission_policy produced evaluated_permission: always_allow,
          # always_ask, or auto (with the server's per-invocation judgement). Absent only
          # when the server refused the call before any policy applied (for example, the
          # named tool is not enabled in the session); such a refusal has
          # evaluated_permission deny. An event recorded before this field existed reads as
          # the arm its evaluated_permission implies (always_allow for allow, always_ask for
          # ask).
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation::Variants
              )
            )
          end
          attr_reader :evaluation

          sig do
            params(
              evaluation:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAllow::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAsk::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAuto::OrHash
                )
            ).void
          end
          attr_writer :evaluation

          # When set, this event was cross-posted from a subagent's thread to surface its
          # permission request on the primary thread's stream. Empty on the thread's own
          # events. Informational only: the server routes the matching
          # `user.tool_confirmation` by `tool_use_id`, so clients do not send it back.
          sig { returns(T.nilable(String)) }
          attr_accessor :session_thread_id

          # Event emitted when the agent invokes a tool provided by an MCP server.
          sig do
            params(
              id: String,
              input: T::Hash[Symbol, T.anything],
              mcp_server_name: String,
              name: String,
              processed_at: Time,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::Type::OrSymbol,
              evaluated_permission:
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission::OrSymbol,
              evaluation:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAllow::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAsk::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAuto::OrHash
                ),
              session_thread_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Input parameters for the tool call.
            input:,
            # Name of the MCP server providing the tool.
            mcp_server_name:,
            # Name of the MCP tool being used.
            name:,
            # Timestamp when this event was processed.
            processed_at:,
            type:,
            # The evaluated permission policy for this tool invocation.
            evaluated_permission: nil,
            # Which resolved permission_policy produced evaluated_permission: always_allow,
            # always_ask, or auto (with the server's per-invocation judgement). Absent only
            # when the server refused the call before any policy applied (for example, the
            # named tool is not enabled in the session); such a refusal has
            # evaluated_permission deny. An event recorded before this field existed reads as
            # the arm its evaluated_permission implies (always_allow for allow, always_ask for
            # ask).
            evaluation: nil,
            # When set, this event was cross-posted from a subagent's thread to surface its
            # permission request on the primary thread's stream. Empty on the thread's own
            # events. Informational only: the server routes the matching
            # `user.tool_confirmation` by `tool_use_id`, so clients do not send it back.
            session_thread_id: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                input: T::Hash[Symbol, T.anything],
                mcp_server_name: String,
                name: String,
                processed_at: Time,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::Type::TaggedSymbol,
                evaluated_permission:
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission::TaggedSymbol,
                evaluation:
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation::Variants,
                session_thread_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT_MCP_TOOL_USE =
              T.let(
                :"agent.mcp_tool_use",
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
