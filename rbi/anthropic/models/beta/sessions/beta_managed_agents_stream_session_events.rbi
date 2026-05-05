# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # Server-sent event in the session stream.
        module BetaManagedAgentsStreamSessionEvents
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
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsStreamSessionEvents::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
