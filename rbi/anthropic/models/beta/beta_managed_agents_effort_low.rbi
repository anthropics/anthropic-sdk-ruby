# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEffortLow = Beta::BetaManagedAgentsEffortLow

    module Beta
      class BetaManagedAgentsEffortLow < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEffortLow,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(Anthropic::Beta::BetaManagedAgentsEffortLow::Type::OrSymbol)
        end
        attr_accessor :type

        # Low effort. Favors latency over reasoning depth.
        sig do
          params(
            type: Anthropic::Beta::BetaManagedAgentsEffortLow::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type: Anthropic::Beta::BetaManagedAgentsEffortLow::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsEffortLow::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOW =
            T.let(
              :low,
              Anthropic::Beta::BetaManagedAgentsEffortLow::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsEffortLow::Type::TaggedSymbol
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
