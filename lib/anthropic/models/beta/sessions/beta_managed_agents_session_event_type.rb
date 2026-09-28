# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # The `type` of a session event.
        module BetaManagedAgentsSessionEventType
          extend Anthropic::Internal::Type::Enum

          USER_MESSAGE = :"user.message"
          USER_INTERRUPT = :"user.interrupt"
          USER_TOOL_CONFIRMATION = :"user.tool_confirmation"
          USER_CUSTOM_TOOL_RESULT = :"user.custom_tool_result"
          AGENT_CUSTOM_TOOL_USE = :"agent.custom_tool_use"
          AGENT_MESSAGE = :"agent.message"
          AGENT_THINKING = :"agent.thinking"
          AGENT_MCP_TOOL_USE = :"agent.mcp_tool_use"
          AGENT_MCP_TOOL_RESULT = :"agent.mcp_tool_result"
          AGENT_TOOL_USE = :"agent.tool_use"
          AGENT_TOOL_RESULT = :"agent.tool_result"
          AGENT_THREAD_MESSAGE_RECEIVED = :"agent.thread_message_received"
          AGENT_THREAD_MESSAGE_SENT = :"agent.thread_message_sent"
          AGENT_THREAD_CONTEXT_COMPACTED = :"agent.thread_context_compacted"
          SESSION_ERROR = :"session.error"
          SESSION_STATUS_RESCHEDULED = :"session.status_rescheduled"
          SESSION_STATUS_RUNNING = :"session.status_running"
          SESSION_STATUS_IDLE = :"session.status_idle"
          SESSION_STATUS_TERMINATED = :"session.status_terminated"
          SESSION_THREAD_CREATED = :"session.thread_created"
          SPAN_OUTCOME_EVALUATION_START = :"span.outcome_evaluation_start"
          SPAN_OUTCOME_EVALUATION_END = :"span.outcome_evaluation_end"
          SPAN_MODEL_REQUEST_START = :"span.model_request_start"
          SPAN_MODEL_REQUEST_END = :"span.model_request_end"
          SPAN_OUTCOME_EVALUATION_ONGOING = :"span.outcome_evaluation_ongoing"
          USER_DEFINE_OUTCOME = :"user.define_outcome"
          SESSION_THREAD_STATUS_RUNNING = :"session.thread_status_running"
          SESSION_THREAD_STATUS_IDLE = :"session.thread_status_idle"
          SESSION_THREAD_STATUS_TERMINATED = :"session.thread_status_terminated"
          USER_TOOL_RESULT = :"user.tool_result"
          SESSION_THREAD_STATUS_RESCHEDULED = :"session.thread_status_rescheduled"
          SESSION_UPDATED = :"session.updated"
          SYSTEM_MESSAGE = :"system.message"
          SESSION_USAGE = :"session.usage"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
