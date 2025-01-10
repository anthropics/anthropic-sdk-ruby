# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      #
      # ```ruby
      # case beta_content_block
      # in {type: "text", text: String, type: Anthropic::Models::Beta::BetaTextBlock::Type}
      #   # Anthropic::Models::Beta::BetaTextBlock ...
      # in {type: "tool_use", id: String, input: Anthropic::Unknown, name: String}
      #   # Anthropic::Models::Beta::BetaToolUseBlock ...
      # end
      # ```
      #
      # @example
      #
      # ```ruby
      # case beta_content_block
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
