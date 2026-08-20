# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSendSessionEvents < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents,
                Anthropic::Internal::AnyHash
              )
            end

          # Sent events
          sig do
            returns(
              T.nilable(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Variants
                ]
              )
            )
          end
          attr_reader :data

          sig do
            params(
              data:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::OrHash,
                    Anthropic::Beta::BetaManagedAgentsUserToolResultEvent::OrHash,
                    Anthropic::Beta::BetaManagedAgentsSystemMessageEvent::OrHash
                  )
                ]
            ).void
          end
          attr_writer :data

          # Events that were successfully sent to the session.
          sig do
            params(
              data:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::OrHash,
                    Anthropic::Beta::BetaManagedAgentsUserToolResultEvent::OrHash,
                    Anthropic::Beta::BetaManagedAgentsSystemMessageEvent::OrHash
                  )
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Sent events
            data: nil
          )
          end

          sig do
            override.returns(
              {
                data:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Variants
                  ]
              }
            )
          end
          def to_hash
          end

          # Union type for events that can be sent to a session.
          module Data
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent,
                  Anthropic::Beta::BetaManagedAgentsUserToolResultEvent,
                  Anthropic::Beta::BetaManagedAgentsSystemMessageEvent
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              USER_MESSAGE =
                T.let(
                  :"user.message",
                  Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Type::TaggedSymbol
                )
              USER_INTERRUPT =
                T.let(
                  :"user.interrupt",
                  Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Type::TaggedSymbol
                )
              USER_TOOL_CONFIRMATION =
                T.let(
                  :"user.tool_confirmation",
                  Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Type::TaggedSymbol
                )
              USER_CUSTOM_TOOL_RESULT =
                T.let(
                  :"user.custom_tool_result",
                  Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Type::TaggedSymbol
                )
              USER_DEFINE_OUTCOME =
                T.let(
                  :"user.define_outcome",
                  Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Type::TaggedSymbol
                )
              USER_TOOL_RESULT =
                T.let(
                  :"user.tool_result",
                  Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Type::TaggedSymbol
                )
              SYSTEM_MESSAGE =
                T.let(
                  :"system.message",
                  Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type: T.any(Symbol, String),
                id: String,
                content:
                  T.any(
                    T::Array[
                      T.any(
                        Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                        Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::OrHash,
                        Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash,
                        Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::OrHash
                      )
                    ],
                    T::Array[
                      T.any(
                        Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                        Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::OrHash,
                        Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash,
                        Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultBlock::OrHash
                      )
                    ],
                    T::Array[
                      Anthropic::Beta::BetaManagedAgentsSystemContentBlock::OrHash
                    ]
                  ),
                processed_at: T.any(T.nilable(Time), Time),
                session_thread_id: T.nilable(String),
                result:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result::OrSymbol,
                tool_use_id: String,
                deny_message: T.nilable(String),
                custom_tool_use_id: String,
                is_error: T.nilable(T::Boolean),
                description: String,
                max_iterations: T.nilable(Integer),
                outcome_id: String,
                rubric:
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsTextRubric::OrHash
                  )
              ).returns(
                Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Variants
              )
            end
            def self.new(
              type:,
              # Unique identifier for this event.
              id:,
              # Array of content blocks comprising the user message.
              content: nil,
              # A timestamp in RFC 3339 format
              processed_at: nil,
              # If absent, interrupts every non-archived thread in a multiagent session (or the
              # primary alone in a single-agent session). If present, interrupts only the named
              # thread.
              session_thread_id: nil,
              # UserToolConfirmationResult enum
              result: nil,
              # The id of the `agent.tool_use` or `agent.mcp_tool_use` event this result
              # corresponds to, which can be found in the last `session.status_idle`
              # [event's](https://platform.claude.com/docs/en/api/beta/sessions/events/list#beta_managed_agents_session_requires_action.event_ids)
              # `stop_reason.event_ids` field.
              tool_use_id: nil,
              # Optional message providing context for a 'deny' decision. Only allowed when
              # result is 'deny'.
              deny_message: nil,
              # The id of the `agent.custom_tool_use` event this result corresponds to, which
              # can be found in the last `session.status_idle`
              # [event's](https://platform.claude.com/docs/en/api/beta/sessions/events/list#beta_managed_agents_session_requires_action.event_ids)
              # `stop_reason.event_ids` field.
              custom_tool_use_id: nil,
              # Whether the tool execution resulted in an error.
              is_error: nil,
              # What the agent should produce. Copied from the input event.
              description: nil,
              # Evaluate-then-revise cycles before giving up. Default 3, max 20.
              max_iterations: nil,
              # Server-generated `outc_` ID for this outcome. Referenced by
              # `span.outcome_evaluation_*` events and the session's `outcome_evaluations` list.
              outcome_id: nil,
              # Rubric for grading the quality of an outcome.
              rubric: nil
            )
            end
          end
        end
      end
    end
  end
end
