# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsSpeed
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::Organization::BetaAnalyticsSpeed)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAST =
            T.let(
              :fast,
              Anthropic::Beta::Organization::BetaAnalyticsSpeed::TaggedSymbol
            )
          STANDARD =
            T.let(
              :standard,
              Anthropic::Beta::Organization::BetaAnalyticsSpeed::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsSpeed::TaggedSymbol
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
