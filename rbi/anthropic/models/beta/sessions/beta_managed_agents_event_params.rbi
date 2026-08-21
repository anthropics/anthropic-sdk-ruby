# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # Union type for event parameters that can be sent to a session.
        module BetaManagedAgentsEventParams
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_MESSAGE =
              T.let(
                :"user.message",
                Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Type::TaggedSymbol
              )
            USER_INTERRUPT =
              T.let(
                :"user.interrupt",
                Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Type::TaggedSymbol
              )
            USER_TOOL_CONFIRMATION =
              T.let(
                :"user.tool_confirmation",
                Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Type::TaggedSymbol
              )
            USER_CUSTOM_TOOL_RESULT =
              T.let(
                :"user.custom_tool_result",
                Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Type::TaggedSymbol
              )
            USER_DEFINE_OUTCOME =
              T.let(
                :"user.define_outcome",
                Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Type::TaggedSymbol
              )
            USER_TOOL_RESULT =
              T.let(
                :"user.tool_result",
                Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Type::TaggedSymbol
              )
            SYSTEM_MESSAGE =
              T.let(
                :"system.message",
                Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Variants
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
              session_thread_id: T.nilable(String),
              result:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result::OrSymbol,
              tool_use_id: String,
              deny_message: T.nilable(String),
              custom_tool_use_id: String,
              is_error: T.nilable(T::Boolean),
              description: String,
              rubric:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileRubricParams::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams::OrHash
                ),
              max_iterations: T.nilable(Integer)
            ).returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Variants
            )
          end
          def self.new(
            type:,
            # Array of content blocks for the user message.
            content: nil,
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
            # What the agent should produce. This is the task specification.
            description: nil,
            # Rubric for grading the quality of an outcome.
            rubric: nil,
            # Eval→revision cycles before giving up. Default 3, max 20.
            max_iterations: nil
          )
          end
        end
      end
    end
  end
end
