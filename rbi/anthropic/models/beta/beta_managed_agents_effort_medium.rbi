# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEffortMedium = Beta::BetaManagedAgentsEffortMedium

    module Beta
      class BetaManagedAgentsEffortMedium < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEffortMedium,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsEffortMedium::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Medium effort. Balances latency and reasoning depth.
        sig do
          params(
            type: Anthropic::Beta::BetaManagedAgentsEffortMedium::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsEffortMedium::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsEffortMedium::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MEDIUM =
            T.let(
              :medium,
              Anthropic::Beta::BetaManagedAgentsEffortMedium::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsEffortMedium::Type::TaggedSymbol
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
