# typed: strong

module Anthropic
  module Helpers
    module Sessions
      class EventAccumulator
        class AccumulationError < Anthropic::Errors::Error
        end

        sig do
          returns(
            T::Hash[
              String,
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent
            ]
          )
        end
        attr_reader :agent_messages

        sig { void }
        def initialize
        end

        sig do
          params(
            event:
              Anthropic::Beta::Sessions::BetaManagedAgentsStreamSessionEvents::Variants
          ).returns(
            Anthropic::Beta::Sessions::BetaManagedAgentsStreamSessionEvents::Variants
          )
        end
        def accumulate(event)
        end

        sig do
          params(
            enum:
              T::Enumerable[
                Anthropic::Beta::Sessions::BetaManagedAgentsStreamSessionEvents::Variants
              ]
          ).returns(
            T::Enumerator[
              Anthropic::Beta::Sessions::BetaManagedAgentsStreamSessionEvents::Variants
            ]
          )
        end
        def wrap(enum)
        end

        sig { params(event_id: String).returns(T.nilable(String)) }
        def agent_message_text(event_id)
        end
      end
    end
  end
end
