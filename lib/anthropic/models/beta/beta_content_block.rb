# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      #
      # ```ruby
      # case union
      # in Anthropic::Models::Beta::BetaTextBlock
      #   # ...
      # in Anthropic::Models::Beta::BetaToolUseBlock
      #   # ...
      # end
      # ```
      class BetaContentBlock < Anthropic::Union
        discriminator :type

        variant :text, -> { Anthropic::Models::Beta::BetaTextBlock }

        variant :tool_use, -> { Anthropic::Models::Beta::BetaToolUseBlock }
      end
    end

    BetaContentBlock = Beta::BetaContentBlock
  end
end
