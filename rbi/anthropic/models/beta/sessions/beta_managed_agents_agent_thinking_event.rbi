# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentThinkingEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Timestamp when this thinking was produced.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig { returns(Symbol) }
          attr_accessor :type

          # Indicates the agent is making forward progress via extended thinking. A progress
          # signal, not a content carrier.
          sig do
            params(id: String, processed_at: Time, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Timestamp when this thinking was produced.
            processed_at:,
            type: :"agent.thinking"
          )
          end

          sig do
            override.returns({ id: String, processed_at: Time, type: Symbol })
          end
          def to_hash
          end
        end
      end
    end
  end
end
