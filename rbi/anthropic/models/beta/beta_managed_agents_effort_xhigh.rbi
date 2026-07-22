# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEffortXhigh = Beta::BetaManagedAgentsEffortXhigh

    module Beta
      class BetaManagedAgentsEffortXhigh < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEffortXhigh,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(Anthropic::Beta::BetaManagedAgentsEffortXhigh::Type::OrSymbol)
        end
        attr_accessor :type

        # Extra-high effort. Not all models accept this level.
        sig do
          params(
            type: Anthropic::Beta::BetaManagedAgentsEffortXhigh::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsEffortXhigh::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsEffortXhigh::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          XHIGH =
            T.let(
              :xhigh,
              Anthropic::Beta::BetaManagedAgentsEffortXhigh::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsEffortXhigh::Type::TaggedSymbol
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
