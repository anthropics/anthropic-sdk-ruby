# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAllowedInferenceGeo
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAllowedInferenceGeo
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          GLOBAL =
            T.let(
              :global,
              Anthropic::Beta::Organization::BetaAllowedInferenceGeo::TaggedSymbol
            )
          US =
            T.let(
              :us,
              Anthropic::Beta::Organization::BetaAllowedInferenceGeo::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAllowedInferenceGeo::TaggedSymbol
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
