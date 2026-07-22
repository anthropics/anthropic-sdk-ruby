# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEffortMax = Beta::BetaManagedAgentsEffortMax

    module Beta
      class BetaManagedAgentsEffortMax < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEffortMax,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(Anthropic::Beta::BetaManagedAgentsEffortMax::Type::OrSymbol)
        end
        attr_accessor :type

        # Maximum effort. Favors reasoning depth over latency.
        sig do
          params(
            type: Anthropic::Beta::BetaManagedAgentsEffortMax::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type: Anthropic::Beta::BetaManagedAgentsEffortMax::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsEffortMax::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MAX =
            T.let(
              :max,
              Anthropic::Beta::BetaManagedAgentsEffortMax::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsEffortMax::Type::TaggedSymbol
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
