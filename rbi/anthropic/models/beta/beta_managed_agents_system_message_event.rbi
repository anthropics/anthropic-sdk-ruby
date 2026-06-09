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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSystemMessageEvent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A timestamp in RFC 3339 format
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
            type:
              Anthropic::Beta::BetaManagedAgentsSystemMessageEvent::Type::OrSymbol,
            processed_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for this event.
          id:,
          # System content blocks. Text-only.
          content:,
          type:,
          # A timestamp in RFC 3339 format
          processed_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              content:
                T::Array[Anthropic::Beta::BetaManagedAgentsSystemContentBlock],
              type:
                Anthropic::Beta::BetaManagedAgentsSystemMessageEvent::Type::TaggedSymbol,
              processed_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsSystemMessageEvent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SYSTEM_MESSAGE =
            T.let(
              :"system.message",
              Anthropic::Beta::BetaManagedAgentsSystemMessageEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSystemMessageEvent::Type::TaggedSymbol
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
