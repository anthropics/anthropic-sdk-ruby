# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Sessions::EventsTest < Anthropic::Test::ResourceTest
  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.sessions.events.list("sesn_011CZkZAtmR3yMPDzynEDxu7")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent
    end

    assert_pattern do
      case row
      in Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent
      in Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent
      end
    end

    assert_pattern do
      case row
      in {
        type: :"user.message",
        id: String,
        content: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::Content]),
        processed_at: Time | nil
      }
      in {type: :"user.interrupt", id: String, processed_at: Time | nil}
      in {
        type: :"user.tool_confirmation",
        id: String,
        result: Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result,
        tool_use_id: String,
        deny_message: String | nil,
        processed_at: Time | nil
      }
      in {
        type: :"user.custom_tool_result",
        id: String,
        custom_tool_use_id: String,
        content: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Content]) | nil,
        is_error: Anthropic::Internal::Type::Boolean | nil,
        processed_at: Time | nil
      }
      in {
        type: :"agent.custom_tool_use",
        id: String,
        input: ^(Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]),
        name: String,
        processed_at: Time
      }
      in {
        type: :"agent.message",
        id: String,
        content: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock]),
        processed_at: Time
      }
      in {type: :"agent.thinking", id: String, processed_at: Time}
      in {
        type: :"agent.mcp_tool_use",
        id: String,
        input: ^(Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]),
        mcp_server_name: String,
        name: String,
        processed_at: Time,
        evaluated_permission: Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission | nil
      }
      in {
        type: :"agent.mcp_tool_result",
        id: String,
        mcp_tool_use_id: String,
        processed_at: Time,
        content: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent::Content]) | nil,
        is_error: Anthropic::Internal::Type::Boolean | nil
      }
      in {
        type: :"agent.tool_use",
        id: String,
        input: ^(Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]),
        name: String,
        processed_at: Time,
        evaluated_permission: Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::EvaluatedPermission | nil
      }
      in {
        type: :"agent.tool_result",
        id: String,
        processed_at: Time,
        tool_use_id: String,
        content: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent::Content]) | nil,
        is_error: Anthropic::Internal::Type::Boolean | nil
      }
      in {type: :"agent.thread_context_compacted", id: String, processed_at: Time}
      in {
        type: :"session.error",
        id: String,
        error: Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error,
        processed_at: Time
      }
      in {type: :"session.status_rescheduled", id: String, processed_at: Time}
      in {type: :"session.status_running", id: String, processed_at: Time}
      in {
        type: :"session.status_idle",
        id: String,
        processed_at: Time,
        stop_reason: Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason
      }
      in {type: :"session.status_terminated", id: String, processed_at: Time}
      in {type: :"span.model_request_start", id: String, processed_at: Time}
      in {
        type: :"span.model_request_end",
        id: String,
        is_error: Anthropic::Internal::Type::Boolean | nil,
        model_request_start_id: String,
        model_usage: Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage,
        processed_at: Time
      }
      in {type: :"session.deleted", id: String, processed_at: Time}
      end
    end
  end

  def test_send__required_params
    response =
      @anthropic.beta.sessions.events.send_(
        "sesn_011CZkZAtmR3yMPDzynEDxu7",
        events: [{content: [{text: "Where is my order #1234?", type: :text}], type: :"user.message"}]
      )

    assert_pattern do
      response => Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents
    end

    assert_pattern do
      response => {
        data: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data]) | nil
      }
    end
  end
end
