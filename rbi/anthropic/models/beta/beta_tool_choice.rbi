# typed: strong

module Anthropic
  module Models
    BetaToolChoice = Beta::BetaToolChoice

    module Beta
      # How the model should use the provided tools. The model can use a specific tool,
      # any available tool, decide by itself, or not use tools at all.
      module BetaToolChoice
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolChoiceAuto,
              Anthropic::Beta::BetaToolChoiceAny,
              Anthropic::Beta::BetaToolChoiceTool,
              Anthropic::Beta::BetaToolChoiceNone
            )
          end

        sig do
          override.returns(T::Array[Anthropic::Beta::BetaToolChoice::Variants])
        end
        def self.variants
        end
      end
    end
  end
end
