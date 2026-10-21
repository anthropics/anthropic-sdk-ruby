# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionDeletedEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Timestamp when the session was deleted.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig { returns(Symbol) }
          attr_accessor :type

          # Emitted when a session has been deleted. Terminates any active event stream — no
          # further events will be emitted for this session.
          sig do
            params(id: String, processed_at: Time, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Timestamp when the session was deleted.
            processed_at:,
            type: :"session.deleted"
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
