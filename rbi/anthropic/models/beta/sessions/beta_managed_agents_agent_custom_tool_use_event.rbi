# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentCustomToolUseEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Input parameters for the tool call.
          sig { returns(T::Hash[Symbol, T.anything]) }
          attr_accessor :input

          # Name of the custom tool being called.
          sig { returns(String) }
          attr_accessor :name

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # When set, this event was cross-posted from a subagent's thread to surface its
          # custom tool use on the primary thread's stream. Empty on the thread's own
          # events. Echo this on a `user.custom_tool_result` event to route the result back.
          sig { returns(T.nilable(String)) }
          attr_accessor :session_thread_id

          # Event emitted when the agent calls a custom tool. The session goes idle until
          # the client sends a `user.custom_tool_result` event with the result.
          sig do
            params(
              id: String,
              input: T::Hash[Symbol, T.anything],
              name: String,
              processed_at: Time,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent::Type::OrSymbol,
              session_thread_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Input parameters for the tool call.
            input:,
            # Name of the custom tool being called.
            name:,
            # A timestamp in RFC 3339 format
            processed_at:,
            type:,
            # When set, this event was cross-posted from a subagent's thread to surface its
            # custom tool use on the primary thread's stream. Empty on the thread's own
            # events. Echo this on a `user.custom_tool_result` event to route the result back.
            session_thread_id: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                input: T::Hash[Symbol, T.anything],
                name: String,
                processed_at: Time,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent::Type::TaggedSymbol,
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT_CUSTOM_TOOL_USE =
              T.let(
                :"agent.custom_tool_use",
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent::Type::TaggedSymbol
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
