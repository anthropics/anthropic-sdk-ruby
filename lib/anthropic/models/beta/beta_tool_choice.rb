# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # How the model should use the provided tools. The model can use a specific tool,
      #   any available tool, decide by itself, or not use tools at all.
      module BetaToolChoice
        extend Anthropic::Union

        discriminator :type

        # The model will automatically decide whether to use tools.
        variant :auto, -> { Anthropic::Models::Beta::BetaToolChoiceAuto }

        # The model will use any available tools.
        variant :any, -> { Anthropic::Models::Beta::BetaToolChoiceAny }

        # The model will use the specified tool with `tool_choice.name`.
        variant :tool, -> { Anthropic::Models::Beta::BetaToolChoiceTool }

        # The model will not be allowed to use tools.
        variant :none, -> { Anthropic::Models::Beta::BetaToolChoiceNone }

        # @!parse
        #   # @return [Array(Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone)]
        #   def self.variants; end
      end
    end

    BetaToolChoice = Beta::BetaToolChoice
  end
end
