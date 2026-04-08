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

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Emitted when a session has been deleted. Terminates any active event stream — no
          # further events will be emitted for this session.
          sig do
            params(
              id: String,
              processed_at: Time,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # A timestamp in RFC 3339 format
            processed_at:,
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                processed_at: Time,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SESSION_DELETED =
              T.let(
                :"session.deleted",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent::Type::TaggedSymbol
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
