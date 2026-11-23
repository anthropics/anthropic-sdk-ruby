# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaWorkspaceChangedConcurrentlyField
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaWorkspaceChangedConcurrentlyField
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INFERENCE_DATA_PRIVACY_HUMAN_REVIEW =
            T.let(
              :"inference_data_privacy.human_review",
              Anthropic::Beta::Organization::BetaWorkspaceChangedConcurrentlyField::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaWorkspaceChangedConcurrentlyField::TaggedSymbol
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
