# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # Union type for all event types in a session.
        module BetaManagedAgentsSessionEvent
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRunningEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent,
                Anthropic::Beta::BetaManagedAgentsUserToolResultEvent,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent,
                Anthropic::Beta::BetaManagedAgentsSessionUpdatedEvent,
                Anthropic::Beta::BetaManagedAgentsSystemMessageEvent,
                Anthropic::Beta::BetaManagedAgentsSessionUsageEvent
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_MESSAGE =
              T.let(
                :"user.message",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            USER_INTERRUPT =
              T.let(
                :"user.interrupt",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            USER_TOOL_CONFIRMATION =
              T.let(
                :"user.tool_confirmation",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            USER_CUSTOM_TOOL_RESULT =
              T.let(
                :"user.custom_tool_result",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            AGENT_CUSTOM_TOOL_USE =
              T.let(
                :"agent.custom_tool_use",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            AGENT_MESSAGE =
              T.let(
                :"agent.message",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            AGENT_THINKING =
              T.let(
                :"agent.thinking",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            AGENT_MCP_TOOL_USE =
              T.let(
                :"agent.mcp_tool_use",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            AGENT_MCP_TOOL_RESULT =
              T.let(
                :"agent.mcp_tool_result",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            AGENT_TOOL_USE =
              T.let(
                :"agent.tool_use",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            AGENT_TOOL_RESULT =
              T.let(
                :"agent.tool_result",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            AGENT_THREAD_MESSAGE_RECEIVED =
              T.let(
                :"agent.thread_message_received",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            AGENT_THREAD_MESSAGE_SENT =
              T.let(
                :"agent.thread_message_sent",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            AGENT_THREAD_CONTEXT_COMPACTED =
              T.let(
                :"agent.thread_context_compacted",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_ERROR =
              T.let(
                :"session.error",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_STATUS_RESCHEDULED =
              T.let(
                :"session.status_rescheduled",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_STATUS_RUNNING =
              T.let(
                :"session.status_running",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_STATUS_IDLE =
              T.let(
                :"session.status_idle",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_STATUS_TERMINATED =
              T.let(
                :"session.status_terminated",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_THREAD_CREATED =
              T.let(
                :"session.thread_created",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SPAN_OUTCOME_EVALUATION_START =
              T.let(
                :"span.outcome_evaluation_start",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SPAN_OUTCOME_EVALUATION_END =
              T.let(
                :"span.outcome_evaluation_end",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SPAN_MODEL_REQUEST_START =
              T.let(
                :"span.model_request_start",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SPAN_MODEL_REQUEST_END =
              T.let(
                :"span.model_request_end",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SPAN_OUTCOME_EVALUATION_ONGOING =
              T.let(
                :"span.outcome_evaluation_ongoing",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            USER_DEFINE_OUTCOME =
              T.let(
                :"user.define_outcome",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_DELETED =
              T.let(
                :"session.deleted",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_THREAD_STATUS_RUNNING =
              T.let(
                :"session.thread_status_running",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_THREAD_STATUS_IDLE =
              T.let(
                :"session.thread_status_idle",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_THREAD_STATUS_TERMINATED =
              T.let(
                :"session.thread_status_terminated",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            USER_TOOL_RESULT =
              T.let(
                :"user.tool_result",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_THREAD_STATUS_RESCHEDULED =
              T.let(
                :"session.thread_status_rescheduled",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_UPDATED =
              T.let(
                :"session.updated",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SYSTEM_MESSAGE =
              T.let(
                :"system.message",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )
            SESSION_USAGE =
              T.let(
                :"session.usage",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Variants
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
                    T.any(
                      Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                      Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::OrHash
                    )
                  ],
                  T::Array[
                    Anthropic::Beta::BetaManagedAgentsSystemContentBlock::OrHash
                  ]
                ),
              processed_at: T.any(T.nilable(Time), Time),
              session_thread_id: T.any(T.nilable(String), String),
              result:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result::OrSymbol,
                  String
                ),
              tool_use_id: String,
              deny_message: T.nilable(String),
              custom_tool_use_id: String,
              is_error: T.nilable(T::Boolean),
              input: T::Hash[Symbol, T.anything],
              name: String,
              mcp_server_name: String,
              evaluated_permission:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission::OrSymbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::EvaluatedPermission::OrSymbol
                ),
              mcp_tool_use_id: String,
              from_session_thread_id: String,
              from_agent_name: T.nilable(String),
              to_session_thread_id: String,
              to_agent_name: T.nilable(String),
              error:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUnknownError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelRateLimitedError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsBillingError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::OrHash
                ),
              stop_reason:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionBudgetReached::OrHash
                ),
              agent_name: String,
              iteration: Integer,
              outcome_id: String,
              explanation: String,
              outcome_evaluation_start_id: String,
              usage:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot::OrHash
                ),
              model_request_start_id: String,
              model_usage:
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage::OrHash,
              description: String,
              max_iterations: T.nilable(Integer),
              rubric:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextRubric::OrHash
                ),
              agent:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsSessionAgent::OrHash
                ),
              budget:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash
                ),
              metadata: T::Hash[Symbol, String],
              title: T.nilable(String)
            ).returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Variants
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
            # Input parameters for the tool call.
            input: nil,
            # Name of the custom tool being called.
            name: nil,
            # Name of the MCP server providing the tool.
            mcp_server_name: nil,
            # AgentEvaluatedPermission enum
            evaluated_permission: nil,
            # The id of the `agent.mcp_tool_use` event this result corresponds to.
            mcp_tool_use_id: nil,
            # Public `sthr_` ID of the thread that sent the message.
            from_session_thread_id: nil,
            # Name of the callable agent this message came from. Absent when received from the
            # primary agent.
            from_agent_name: nil,
            # Public `sthr_` ID of the thread the message was sent to.
            to_session_thread_id: nil,
            # Name of the callable agent this message was sent to. Absent when sent to the
            # primary agent.
            to_agent_name: nil,
            # An unknown or unexpected error occurred during session execution. A fallback
            # variant; clients that don't recognize a new error code can match on
            # `retry_status` and `message` alone.
            error: nil,
            # The agent completed its turn naturally and is ready for the next user message.
            stop_reason: nil,
            # Name of the callable agent the thread runs.
            agent_name: nil,
            # 0-indexed revision cycle. 0 is the first evaluation; 1 is the re-evaluation
            # after the first revision; etc.
            iteration: nil,
            # The `outc_` ID of the outcome being evaluated.
            outcome_id: nil,
            # Human-readable explanation of the verdict. For `needs_revision`, describes which
            # criteria failed and why.
            explanation: nil,
            # The id of the corresponding `span.outcome_evaluation_start` event.
            outcome_evaluation_start_id: nil,
            # Token usage for a single model request.
            usage: nil,
            # The id of the corresponding `span.model_request_start` event.
            model_request_start_id: nil,
            # Token usage for a single model request.
            model_usage: nil,
            # What the agent should produce. Copied from the input event.
            description: nil,
            # Evaluate-then-revise cycles before giving up. Default 3, max 20.
            max_iterations: nil,
            # Rubric for grading the quality of an outcome.
            rubric: nil,
            # Resolved `agent` definition for a `session`. Snapshot of the `agent` at
            # `session` creation time.
            agent: nil,
            # A hard spend ceiling. The session stops issuing new model requests once the
            # tracked list cost reaches `max_list_cost`.
            budget: nil,
            # The session's full metadata bag after the update. Present when the update set
            # non-empty metadata; absent when metadata was unchanged or cleared to empty.
            metadata: nil,
            # The session's new title. Present only when the update changed it.
            title: nil
          )
          end
        end
      end
    end
  end
end
