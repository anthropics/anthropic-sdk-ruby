# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      #
      # ```ruby
      # case union
      # in Anthropic::Models::Beta::BetaTextBlockParam
      #   # ...
      # in Anthropic::Models::Beta::BetaImageBlockParam
      #   # ...
      # in Anthropic::Models::Beta::BetaToolUseBlockParam
      #   # ...
      # in Anthropic::Models::Beta::BetaToolResultBlockParam
      #   # ...
      # in Anthropic::Models::Beta::BetaBase64PDFBlock
      #   # ...
      # end
      # ```
      class BetaContentBlockParam < Anthropic::Union
        discriminator :type

        variant :text, -> { Anthropic::Models::Beta::BetaTextBlockParam }

        variant :image, -> { Anthropic::Models::Beta::BetaImageBlockParam }

        variant :tool_use, -> { Anthropic::Models::Beta::BetaToolUseBlockParam }

        variant :tool_result, -> { Anthropic::Models::Beta::BetaToolResultBlockParam }

        variant :document, -> { Anthropic::Models::Beta::BetaBase64PDFBlock }
      end
    end

    BetaContentBlockParam = Beta::BetaContentBlockParam
  end
end
