# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSpanModelRequestStartEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Timestamp when the model request started.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig { returns(Symbol) }
          attr_accessor :type

          # Emitted when a model request is initiated by the agent.
          sig do
            params(id: String, processed_at: Time, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Timestamp when the model request started.
            processed_at:,
            type: :"span.model_request_start"
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
