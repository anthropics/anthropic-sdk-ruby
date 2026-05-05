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

          # A session thread hit a transient error and is retrying automatically. Emitted on the thread's own stream and cross-posted to the primary stream for child threads.
          variant :"session.thread_status_rescheduled",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent)]
        end
      end
    end
  end
end
