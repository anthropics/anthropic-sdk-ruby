# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserInterruptEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :processed_at

          # An interrupt event that pauses agent execution and returns control to the user.
          sig do
            params(
              id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::Type::OrSymbol,
              processed_at: T.nilable(Time)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            type:,
            # A timestamp in RFC 3339 format
            processed_at: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::Type::TaggedSymbol,
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_INTERRUPT =
              T.let(
                :"user.interrupt",
                Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::Type::TaggedSymbol
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
end
