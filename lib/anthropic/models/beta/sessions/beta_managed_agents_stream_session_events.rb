# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # Server-sent event in the session stream.
        #
        # @see Anthropic::Resources::Beta::Sessions::Events#stream_events
        module BetaManagedAgentsStreamSessionEvents
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

          # Emitted when a model request is initiated by the agent.
          variant :"span.model_request_start",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent }

          # Emitted when a model request completes.
          variant :"span.model_request_end",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent }

          # Emitted when a session has been deleted. Terminates any active event stream — no further events will be emitted for this session.
          variant :"session.deleted", -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent)]
        end
      end
    end
  end
end
