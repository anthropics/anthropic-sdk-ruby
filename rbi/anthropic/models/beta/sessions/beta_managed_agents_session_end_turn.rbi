# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionEndTurn < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The agent completed its turn naturally and is ready for the next user message.
          sig do
            params(
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            END_TURN =
              T.let(
                :end_turn,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn::Type::TaggedSymbol
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
