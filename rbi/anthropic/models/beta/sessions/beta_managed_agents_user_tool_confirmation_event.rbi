# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserToolConfirmationEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # UserToolConfirmationResult enum
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result::TaggedSymbol
            )
          end
          attr_accessor :result

          # The id of the `agent.tool_use` or `agent.mcp_tool_use` event this result
          # corresponds to, which can be found in the last `session.status_idle`
          # [event's](https://platform.claude.com/docs/en/api/beta/sessions/events/list#beta_managed_agents_session_requires_action.event_ids)
          # `stop_reason.event_ids` field.
          sig { returns(String) }
          attr_accessor :tool_use_id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Optional message providing context for a 'deny' decision. Only allowed when
          # result is 'deny'.
          sig { returns(T.nilable(String)) }
          attr_accessor :deny_message

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :processed_at

          # When set, the confirmation routes to this subagent's thread rather than the
          # primary. Echo this from the `session_thread_id` on the `agent.tool_use` or
          # `agent.mcp_tool_use` event that prompted the approval.
          sig { returns(T.nilable(String)) }
          attr_accessor :session_thread_id

          # A tool confirmation event that approves or denies a pending tool execution.
          sig do
            params(
              id: String,
              result:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result::OrSymbol,
              tool_use_id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Type::OrSymbol,
              deny_message: T.nilable(String),
              processed_at: T.nilable(Time),
              session_thread_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # UserToolConfirmationResult enum
            result:,
            # The id of the `agent.tool_use` or `agent.mcp_tool_use` event this result
            # corresponds to, which can be found in the last `session.status_idle`
            # [event's](https://platform.claude.com/docs/en/api/beta/sessions/events/list#beta_managed_agents_session_requires_action.event_ids)
            # `stop_reason.event_ids` field.
            tool_use_id:,
            type:,
            # Optional message providing context for a 'deny' decision. Only allowed when
            # result is 'deny'.
            deny_message: nil,
            # A timestamp in RFC 3339 format
            processed_at: nil,
            # When set, the confirmation routes to this subagent's thread rather than the
            # primary. Echo this from the `session_thread_id` on the `agent.tool_use` or
            # `agent.mcp_tool_use` event that prompted the approval.
            session_thread_id: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                result:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result::TaggedSymbol,
                tool_use_id: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Type::TaggedSymbol,
                deny_message: T.nilable(String),
                processed_at: T.nilable(Time),
                session_thread_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # UserToolConfirmationResult enum
          module Result
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALLOW =
              T.let(
                :allow,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result::TaggedSymbol
              )
            DENY =
              T.let(
                :deny,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_TOOL_CONFIRMATION =
              T.let(
                :"user.tool_confirmation",
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Type::TaggedSymbol
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
