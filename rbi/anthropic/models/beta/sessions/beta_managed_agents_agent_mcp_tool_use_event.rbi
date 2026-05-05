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

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # AgentEvaluatedPermission enum
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission::TaggedSymbol
              )
            )
          end
          attr_reader :evaluated_permission

          sig do
            params(
              evaluated_permission:
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission::OrSymbol
            ).void
          end
          attr_writer :evaluated_permission

          # When set, this event was cross-posted from a subagent's thread to surface its
          # permission request on the primary thread's stream. Empty on the thread's own
          # events. Echo this on a `user.tool_confirmation` event to route the approval
          # back.
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
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission::OrSymbol,
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
            # A timestamp in RFC 3339 format
            processed_at:,
            type:,
            # AgentEvaluatedPermission enum
            evaluated_permission: nil,
            # When set, this event was cross-posted from a subagent's thread to surface its
            # permission request on the primary thread's stream. Empty on the thread's own
            # events. Echo this on a `user.tool_confirmation` event to route the approval
            # back.
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission::TaggedSymbol,
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

          # AgentEvaluatedPermission enum
          module EvaluatedPermission
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALLOW =
              T.let(
                :allow,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission::TaggedSymbol
              )
            ASK =
              T.let(
                :ask,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission::TaggedSymbol
              )
            DENY =
              T.let(
                :deny,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission::TaggedSymbol
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
