# typed: strong

module Anthropic
  module Models
    BetaDreamSessionsInput = Beta::BetaDreamSessionsInput

    module Beta
      class BetaDreamSessionsInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDreamSessionsInput,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T::Array[String]) }
        attr_accessor :session_ids

        sig { returns(Anthropic::Beta::BetaDreamSessionsInput::Type::OrSymbol) }
        attr_accessor :type

        # Input session transcripts the dream reads.
        sig do
          params(
            session_ids: T::Array[String],
            type: Anthropic::Beta::BetaDreamSessionsInput::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(session_ids:, type:)
        end

        sig do
          override.returns(
            {
              session_ids: T::Array[String],
              type: Anthropic::Beta::BetaDreamSessionsInput::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaDreamSessionsInput::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SESSIONS =
            T.let(
              :sessions,
              Anthropic::Beta::BetaDreamSessionsInput::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaDreamSessionsInput::Type::TaggedSymbol
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
