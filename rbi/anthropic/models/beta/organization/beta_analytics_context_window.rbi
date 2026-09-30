# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsContextWindow
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsContextWindow
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FROM_0_TO_200K =
            T.let(
              :"0-200k",
              Anthropic::Beta::Organization::BetaAnalyticsContextWindow::TaggedSymbol
            )
          FROM_200K_TO_1_M =
            T.let(
              :"200k-1M",
              Anthropic::Beta::Organization::BetaAnalyticsContextWindow::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsContextWindow::TaggedSymbol
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
