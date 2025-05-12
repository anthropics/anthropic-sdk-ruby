# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # How the model should use the provided tools. The model can use a specific tool,
      # any available tool, decide by itself, or not use tools at all.
      module BetaToolChoice
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The model will automatically decide whether to use tools.
        variant :auto, -> { Anthropic::Beta::BetaToolChoiceAuto }

        # The model will use any available tools.
        variant :any, -> { Anthropic::Beta::BetaToolChoiceAny }

        # The model will use the specified tool with `tool_choice.name`.
        variant :tool, -> { Anthropic::Beta::BetaToolChoiceTool }

        # The model will not be allowed to use tools.
        variant :none, -> { Anthropic::Beta::BetaToolChoiceNone }

        # @!method self.variants
        #   @return [Array(Anthropic::Beta::BetaToolChoiceAuto, Anthropic::Beta::BetaToolChoiceAny, Anthropic::Beta::BetaToolChoiceTool, Anthropic::Beta::BetaToolChoiceNone)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolChoiceAuto,
              Anthropic::Beta::BetaToolChoiceAny,
              Anthropic::Beta::BetaToolChoiceTool,
              Anthropic::Beta::BetaToolChoiceNone
            )
          end
        end
      end
    end

    BetaToolChoice = Beta::BetaToolChoice
  end
end
