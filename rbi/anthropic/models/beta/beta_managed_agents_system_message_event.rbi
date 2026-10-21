# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSystemMessageEvent =
      Beta::BetaManagedAgentsSystemMessageEvent

    module Beta
      class BetaManagedAgentsSystemMessageEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSystemMessageEvent,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for this event.
        sig { returns(String) }
        attr_accessor :id

        # System content blocks. Text-only.
        sig do
          returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsSystemContentBlock]
          )
        end
        attr_accessor :content

        sig { returns(Symbol) }
        attr_accessor :type

        # Timestamp when this system message was processed.
        sig { returns(T.nilable(Time)) }
        attr_accessor :processed_at

        # A mid-conversation system message event. Carries system-role content that is
        # appended to the session as a `role: "system"` turn.
        sig do
          params(
            id: String,
            content:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSystemContentBlock::OrHash
              ],
            processed_at: T.nilable(Time),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for this event.
          id:,
          # System content blocks. Text-only.
          content:,
          # Timestamp when this system message was processed.
          processed_at: nil,
          type: :"system.message"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              content:
                T::Array[Anthropic::Beta::BetaManagedAgentsSystemContentBlock],
              type: Symbol,
              processed_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
