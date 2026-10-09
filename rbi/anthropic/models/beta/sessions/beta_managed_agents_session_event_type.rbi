# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # The `type` of a session event.
        module BetaManagedAgentsSessionEventType
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          USER_MESSAGE =
            T.let(
              :"user.message",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          USER_INTERRUPT =
            T.let(
              :"user.interrupt",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          USER_TOOL_CONFIRMATION =
            T.let(
              :"user.tool_confirmation",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          USER_CUSTOM_TOOL_RESULT =
            T.let(
              :"user.custom_tool_result",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          AGENT_CUSTOM_TOOL_USE =
            T.let(
              :"agent.custom_tool_use",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          AGENT_MESSAGE =
            T.let(
              :"agent.message",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          AGENT_THINKING =
            T.let(
              :"agent.thinking",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          AGENT_MCP_TOOL_USE =
            T.let(
              :"agent.mcp_tool_use",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          AGENT_MCP_TOOL_RESULT =
            T.let(
              :"agent.mcp_tool_result",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          AGENT_TOOL_USE =
            T.let(
              :"agent.tool_use",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          AGENT_TOOL_RESULT =
            T.let(
              :"agent.tool_result",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          AGENT_THREAD_MESSAGE_RECEIVED =
            T.let(
              :"agent.thread_message_received",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          AGENT_THREAD_MESSAGE_SENT =
            T.let(
              :"agent.thread_message_sent",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          AGENT_THREAD_CONTEXT_COMPACTED =
            T.let(
              :"agent.thread_context_compacted",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_ERROR =
            T.let(
              :"session.error",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_STATUS_RESCHEDULED =
            T.let(
              :"session.status_rescheduled",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_STATUS_RUNNING =
            T.let(
              :"session.status_running",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_STATUS_IDLE =
            T.let(
              :"session.status_idle",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_STATUS_TERMINATED =
            T.let(
              :"session.status_terminated",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_THREAD_CREATED =
            T.let(
              :"session.thread_created",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SPAN_OUTCOME_EVALUATION_START =
            T.let(
              :"span.outcome_evaluation_start",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SPAN_OUTCOME_EVALUATION_END =
            T.let(
              :"span.outcome_evaluation_end",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SPAN_MODEL_REQUEST_START =
            T.let(
              :"span.model_request_start",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SPAN_MODEL_REQUEST_END =
            T.let(
              :"span.model_request_end",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SPAN_OUTCOME_EVALUATION_ONGOING =
            T.let(
              :"span.outcome_evaluation_ongoing",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          USER_DEFINE_OUTCOME =
            T.let(
              :"user.define_outcome",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_THREAD_STATUS_RUNNING =
            T.let(
              :"session.thread_status_running",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_THREAD_STATUS_IDLE =
            T.let(
              :"session.thread_status_idle",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_THREAD_STATUS_TERMINATED =
            T.let(
              :"session.thread_status_terminated",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          USER_TOOL_RESULT =
            T.let(
              :"user.tool_result",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_THREAD_STATUS_RESCHEDULED =
            T.let(
              :"session.thread_status_rescheduled",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_UPDATED =
            T.let(
              :"session.updated",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SYSTEM_MESSAGE =
            T.let(
              :"system.message",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          SESSION_USAGE =
            T.let(
              :"session.usage",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          WORKFLOW_RUN_CREATED =
            T.let(
              :"workflow_run.created",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          WORKFLOW_RUN_STATUS_RUNNING =
            T.let(
              :"workflow_run.status_running",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          WORKFLOW_RUN_STATUS_IDLE =
            T.let(
              :"workflow_run.status_idle",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          WORKFLOW_RUN_STATUS_ENDED =
            T.let(
              :"workflow_run.status_ended",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          WORKFLOW_RUN_ERROR =
            T.let(
              :"workflow_run.error",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          WORKFLOW_RUN_PHASE_STARTED =
            T.let(
              :"workflow_run.phase_started",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )
          WORKFLOW_RUN_PHASE_ENDED =
            T.let(
              :"workflow_run.phase_ended",
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::TaggedSymbol
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
