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

          # Timestamp when this tool use was processed.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig { returns(Symbol) }
          attr_accessor :type

          # When set, this event was cross-posted from a subagent's thread to surface its
          # custom tool use on the primary thread's stream. Empty on the thread's own
          # events. Informational only: the server routes the matching
          # `user.custom_tool_result` by `custom_tool_use_id`, so clients do not send it
          # back.
          sig { returns(T.nilable(String)) }
          attr_accessor :session_thread_id

          # Event emitted when the agent calls a custom tool. The session goes idle until
          # the client sends a `user.custom_tool_result` event with the result. The client
          # can send it as soon as this event arrives, without waiting for
          # `session.status_idle`.
          sig do
            params(
              id: String,
              input: T::Hash[Symbol, T.anything],
              name: String,
              processed_at: Time,
              session_thread_id: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Input parameters for the tool call.
            input:,
            # Name of the custom tool being called.
            name:,
            # Timestamp when this tool use was processed.
            processed_at:,
            # When set, this event was cross-posted from a subagent's thread to surface its
            # custom tool use on the primary thread's stream. Empty on the thread's own
            # events. Informational only: the server routes the matching
            # `user.custom_tool_result` by `custom_tool_use_id`, so clients do not send it
            # back.
            session_thread_id: nil,
            type: :"agent.custom_tool_use"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                input: T::Hash[Symbol, T.anything],
                name: String,
                processed_at: Time,
                type: Symbol,
                session_thread_id: T.nilable(String)
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
