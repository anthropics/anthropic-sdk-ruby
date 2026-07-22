# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEffortHigh = Beta::BetaManagedAgentsEffortHigh

    module Beta
      class BetaManagedAgentsEffortHigh < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEffortHigh,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(Anthropic::Beta::BetaManagedAgentsEffortHigh::Type::OrSymbol)
        end
        attr_accessor :type

        # High effort. Favors reasoning depth.
        sig do
          params(
            type: Anthropic::Beta::BetaManagedAgentsEffortHigh::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type: Anthropic::Beta::BetaManagedAgentsEffortHigh::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsEffortHigh::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIGH =
            T.let(
              :high,
              Anthropic::Beta::BetaManagedAgentsEffortHigh::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsEffortHigh::Type::TaggedSymbol
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
