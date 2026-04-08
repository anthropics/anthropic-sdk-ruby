# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserToolConfirmationEventParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams,
                Anthropic::Internal::AnyHash
              )
            end

          # UserToolConfirmationResult enum
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result::OrSymbol
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
              Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Optional message providing context for a 'deny' decision. Only allowed when
          # result is 'deny'.
          sig { returns(T.nilable(String)) }
          attr_accessor :deny_message

          # Parameters for confirming or denying a tool execution request.
          sig do
            params(
              result:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result::OrSymbol,
              tool_use_id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Type::OrSymbol,
              deny_message: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
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
            deny_message: nil
          )
          end

          sig do
            override.returns(
              {
                result:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result::OrSymbol,
                tool_use_id: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Type::OrSymbol,
                deny_message: T.nilable(String)
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALLOW =
              T.let(
                :allow,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result::TaggedSymbol
              )
            DENY =
              T.let(
                :deny,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_TOOL_CONFIRMATION =
              T.let(
                :"user.tool_confirmation",
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Type::TaggedSymbol
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
