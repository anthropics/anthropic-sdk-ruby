# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionStatusTerminatedEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Timestamp of status change.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig { returns(Symbol) }
          attr_accessor :type

          # Indicates the session has terminated, either due to an error or completion.
          sig do
            params(id: String, processed_at: Time, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Timestamp of status change.
            processed_at:,
            type: :"session.status_terminated"
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
