# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # Server-sent event in a single thread's stream.
        module BetaManagedAgentsStreamSessionThreadEvents
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # A user message event in the session conversation.
          variant :"user.message", -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent }

          # An interrupt event that pauses agent execution and returns control to the user.
          variant :"user.interrupt", -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent }

          # A tool confirmation event that approves or denies a pending tool execution.
          variant :"user.tool_confirmation",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent }

          # Event sent by the client providing the result of a custom tool execution.
          variant :"user.custom_tool_result",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent }

          # Event emitted when the agent calls a custom tool. The session goes idle until the client sends a `user.custom_tool_result` event with the result.
          variant :"agent.custom_tool_use",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent }

          # An agent response event in the session conversation.
          variant :"agent.message", -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent }

          # Indicates the agent is making forward progress via extended thinking. A progress signal, not a content carrier.
          variant :"agent.thinking", -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent }

          # Event emitted when the agent invokes a tool provided by an MCP server.
          variant :"agent.mcp_tool_use", -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent }

          # Event representing the result of an MCP tool execution.
          variant :"agent.mcp_tool_result",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent }

          # Event emitted when the agent invokes a built-in agent tool.
          variant :"agent.tool_use", -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent }

          # Event representing the result of an agent tool execution.
          variant :"agent.tool_result", -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent }

          # Delivery event written to the target thread's input stream when an agent-to-agent message arrives.
          variant :"agent.thread_message_received",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent }

          # Observability event emitted to the sender's output stream when an agent-to-agent message is sent.
          variant :"agent.thread_message_sent",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent }

          # Indicates that context compaction (summarization) occurred during the session.
          variant :"agent.thread_context_compacted",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent }

          # An error event indicating a problem occurred during session execution.
          variant :"session.error", -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent }

          # Indicates the session is recovering from an error state and is rescheduled for execution.
          variant :"session.status_rescheduled",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent }

          # Indicates the session is actively running and the agent is working.
          variant :"session.status_running",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent }

          # Indicates the agent has paused and is awaiting user input.
          variant :"session.status_idle", -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent }

          # Indicates the session has terminated, either due to an error or completion.
          variant :"session.status_terminated",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent }

          # Emitted when a subagent is spawned as a new thread. Written to the parent thread's output stream so clients observing the session see child creation.
          variant :"session.thread_created",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent }

          # Emitted when an outcome evaluation cycle begins.
          variant :"span.outcome_evaluation_start",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent }

          # Emitted when an outcome evaluation cycle completes. Carries the verdict and aggregate token usage. A verdict of `needs_revision` means another evaluation cycle follows; `satisfied`, `max_iterations_reached`, `failed`, or `interrupted` are terminal — no further evaluation cycles follow.
          variant :"span.outcome_evaluation_end",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent }

          # Emitted when a model request is initiated by the agent.
          variant :"span.model_request_start",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent }

          # Emitted when a model request completes.
          variant :"span.model_request_end",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent }

          # Periodic heartbeat emitted while an outcome evaluation cycle is in progress. Distinguishes 'evaluation is actively running' from 'evaluation is stuck' between the corresponding `span.outcome_evaluation_start` and `span.outcome_evaluation_end` events.
          variant :"span.outcome_evaluation_ongoing",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent }

          # Echo of a `user.define_outcome` input event. Carries the server-generated `outcome_id` that subsequent `span.outcome_evaluation_*` events reference.
          variant :"user.define_outcome", -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent }

          # Emitted when a session has been deleted. Terminates any active event stream — no further events will be emitted for this session.
          variant :"session.deleted", -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent }

          # A session thread has begun executing. Emitted on the thread's own stream and cross-posted to the primary stream for child threads.
          variant :"session.thread_status_running",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRunningEvent }

          # A session thread has yielded and is awaiting input. Emitted on the thread's own stream and cross-posted to the primary stream for child threads.
          variant :"session.thread_status_idle",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent }

          # A session thread has terminated and will accept no further input. Emitted on the thread's own stream and cross-posted to the primary stream for child threads.
          variant :"session.thread_status_terminated",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent }

          # Event sent by the client providing the result of an agent-toolset tool execution. Only valid on `self_hosted` environments, where sandbox-routed tools are executed by the client rather than the server.
          variant :"user.tool_result", -> { Anthropic::Beta::BetaManagedAgentsUserToolResultEvent }

          # A session thread hit a transient error and is retrying automatically. Emitted on the thread's own stream and cross-posted to the primary stream for child threads.
          variant :"session.thread_status_rescheduled",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent }

          # Emitted when an UpdateSession request changed at least one field. Carries only the fields that changed; absent fields were not part of the update. The new configuration applies from the next turn.
          variant :"session.updated", -> { Anthropic::Beta::BetaManagedAgentsSessionUpdatedEvent }

          # Opens a preview of a buffered event. Carries the previewed event's type and id only. Followed by zero or more event_delta events with the same event id, normally concluded by the buffered event carrying that id. If the producing model request ends without that event (an error or interrupt mid-stream), its terminal span.model_request_end closes the preview. Only sent on stream connections that opt in via event_deltas; never appears in event history.
          variant :event_start, -> { Anthropic::Beta::BetaManagedAgentsStartEvent }

          # An incremental update to an event that is still being streamed. Deltas are best-effort and may stop early; when the buffered event with id == event_id is produced it carries the complete content. A model request that ends early (an error or interrupt) produces no buffered event — its terminal span.model_request_end closes the preview. Only sent on stream connections that opt in via event_deltas; never appears in event history.
          variant :event_delta, -> { Anthropic::Beta::BetaManagedAgentsDeltaEvent }

          # A mid-conversation system message event. Carries system-role content that is appended to the session as a `role: "system"` turn.
          variant :"system.message", -> { Anthropic::Beta::BetaManagedAgentsSystemMessageEvent }

          # Periodic snapshot of the session's cumulative usage and tracked list cost.
          variant :"session.usage", -> { Anthropic::Beta::BetaManagedAgentsSessionUsageEvent }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent, Anthropic::Models::Beta::BetaManagedAgentsUserToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent, Anthropic::Models::Beta::BetaManagedAgentsSessionUpdatedEvent, Anthropic::Models::Beta::BetaManagedAgentsStartEvent, Anthropic::Models::Beta::BetaManagedAgentsDeltaEvent, Anthropic::Models::Beta::BetaManagedAgentsSystemMessageEvent, Anthropic::Models::Beta::BetaManagedAgentsSessionUsageEvent)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::BetaManagedAgentsStreamSessionThreadEvents}
          # for more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :id Unique identifier for this event.
          #
          #   @option args [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock>, Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultBlock>, Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock>, Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>] :content Array of content blocks comprising the user message.
          #
          #   @option args [Time, nil, Time] :processed_at A timestamp in RFC 3339 format
          #
          #   @option args [String, nil, String] :session_thread_id If absent, interrupts every non-archived thread in a multiagent session (or the
          #
          #   @option args [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result, String] :result UserToolConfirmationResult enum
          #
          #   @option args [String] :tool_use_id The id of the `agent.tool_use` or `agent.mcp_tool_use` event this result corresp
          #
          #   @option args [String, nil] :deny_message Optional message providing context for a 'deny' decision. Only allowed when resu
          #
          #   @option args [String] :custom_tool_use_id The id of the `agent.custom_tool_use` event this result corresponds to, which ca
          #
          #   @option args [Boolean, nil] :is_error Whether the tool execution resulted in an error.
          #
          #   @option args [Hash{Symbol=>Object}] :input Input parameters for the tool call.
          #
          #   @option args [String] :name Name of the custom tool being called.
          #
          #   @option args [String] :mcp_server_name Name of the MCP server providing the tool.
          #
          #   @option args [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission, Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::EvaluatedPermission] :evaluated_permission AgentEvaluatedPermission enum
          #
          #   @option args [String] :mcp_tool_use_id The id of the `agent.mcp_tool_use` event this result corresponds to.
          #
          #   @option args [String] :from_session_thread_id Public `sthr_` ID of the thread that sent the message.
          #
          #   @option args [String, nil] :from_agent_name Name of the callable agent this message came from. Absent when received from the
          #
          #   @option args [String] :to_session_thread_id Public `sthr_` ID of the thread the message was sent to.
          #
          #   @option args [String, nil] :to_agent_name Name of the callable agent this message was sent to. Absent when sent to the pri
          #
          #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelOverloadedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRateLimitedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRequestFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBillingError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError] :error An unknown or unexpected error occurred during session execution. A fallback var
          #
          #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionEndTurn, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRequiresAction, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionBudgetReached] :stop_reason The agent completed its turn naturally and is ready for the next user message.
          #
          #   @option args [String] :agent_name Name of the callable agent the thread runs.
          #
          #   @option args [Integer] :iteration 0-indexed revision cycle. 0 is the first evaluation; 1 is the re-evaluation afte
          #
          #   @option args [String] :outcome_id The `outc_` ID of the outcome being evaluated.
          #
          #   @option args [String] :explanation Human-readable explanation of the verdict. For `needs_revision`, describes which
          #
          #   @option args [String] :outcome_evaluation_start_id The id of the corresponding `span.outcome_evaluation_start` event.
          #
          #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelUsage, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot] :usage Token usage for a single model request.
          #
          #   @option args [String] :model_request_start_id The id of the corresponding `span.model_request_start` event.
          #
          #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelUsage] :model_usage Token usage for a single model request.
          #
          #   @option args [String] :description What the agent should produce. Copied from the input event.
          #
          #   @option args [Integer, nil] :max_iterations Evaluate-then-revise cycles before giving up. Default 3, max 20.
          #
          #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric] :rubric Rubric for grading the quality of an outcome.
          #
          #   @option args [Anthropic::Models::Beta::BetaManagedAgentsSessionAgent, nil] :agent Resolved `agent` definition for a `session`. Snapshot of the `agent` at `session
          #
          #   @option args [Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit, nil] :budget A hard spend ceiling. The session stops issuing new model requests once the trac
          #
          #   @option args [Hash{Symbol=>String}] :metadata The session's full metadata bag after the update. Present when the update set no
          #
          #   @option args [String, nil] :title The session's new title. Present only when the update changed it.
          #
          #   @option args [Anthropic::Models::Beta::BetaManagedAgentsAgentMessagePreview, Anthropic::Models::Beta::BetaManagedAgentsAgentThinkingPreview] :event The previewed event's type and id. The event type determines which delta types t
          #
          #   @option args [Anthropic::Models::Beta::BetaManagedAgentsDeltaContent] :delta One fragment of the previewed event. The delta type is named for the previewed e
          #
          #   @option args [String] :event_id The id of the event being previewed. Matches event.id on the corresponding event
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent, Anthropic::Models::Beta::BetaManagedAgentsUserToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent, Anthropic::Models::Beta::BetaManagedAgentsSessionUpdatedEvent, Anthropic::Models::Beta::BetaManagedAgentsStartEvent, Anthropic::Models::Beta::BetaManagedAgentsDeltaEvent, Anthropic::Models::Beta::BetaManagedAgentsSystemMessageEvent, Anthropic::Models::Beta::BetaManagedAgentsSessionUsageEvent]
          def self.new(type:, **args)
            case type.to_sym
            when :"user.message"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent.new(**args)
            when :"user.interrupt"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent.new(**args)
            when :"user.tool_confirmation"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent.new(**args)
            when :"user.custom_tool_result"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent.new(**args)
            when :"agent.custom_tool_use"
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent.new(**args)
            when :"agent.message"
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent.new(**args)
            when :"agent.thinking"
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent.new(**args)
            when :"agent.mcp_tool_use"
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent.new(**args)
            when :"agent.mcp_tool_result"
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent.new(**args)
            when :"agent.tool_use"
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent.new(**args)
            when :"agent.tool_result"
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent.new(**args)
            when :"agent.thread_message_received"
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent.new(**args)
            when :"agent.thread_message_sent"
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent.new(**args)
            when :"agent.thread_context_compacted"
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent.new(**args)
            when :"session.error"
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent.new(**args)
            when :"session.status_rescheduled"
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent.new(**args)
            when :"session.status_running"
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent.new(**args)
            when :"session.status_idle"
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent.new(**args)
            when :"session.status_terminated"
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent.new(**args)
            when :"session.thread_created"
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent.new(**args)
            when :"span.outcome_evaluation_start"
              Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent.new(**args)
            when :"span.outcome_evaluation_end"
              Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent.new(**args)
            when :"span.model_request_start"
              Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent.new(**args)
            when :"span.model_request_end"
              Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent.new(**args)
            when :"span.outcome_evaluation_ongoing"
              Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent.new(**args)
            when :"user.define_outcome"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent.new(**args)
            when :"session.deleted"
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent.new(**args)
            when :"session.thread_status_running"
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRunningEvent.new(**args)
            when :"session.thread_status_idle"
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent.new(**args)
            when :"session.thread_status_terminated"
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent.new(**args)
            when :"user.tool_result"
              Anthropic::Beta::BetaManagedAgentsUserToolResultEvent.new(**args)
            when :"session.thread_status_rescheduled"
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent.new(**args)
            when :"session.updated"
              Anthropic::Beta::BetaManagedAgentsSessionUpdatedEvent.new(**args)
            when :event_start
              Anthropic::Beta::BetaManagedAgentsStartEvent.new(**args)
            when :event_delta
              Anthropic::Beta::BetaManagedAgentsDeltaEvent.new(**args)
            when :"system.message"
              Anthropic::Beta::BetaManagedAgentsSystemMessageEvent.new(**args)
            when :"session.usage"
              Anthropic::Beta::BetaManagedAgentsSessionUsageEvent.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
