# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      #
      # @example
      # ```ruby
      # case beta_content_block
      # in {type: "text", citations: ^(Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaTextCitation]), text: String}
      #   # Anthropic::Models::Beta::BetaTextBlock ...
      # in {type: "tool_use", id: String, input: Anthropic::Unknown, name: String}
      #   # Anthropic::Models::Beta::BetaToolUseBlock ...
      # in {type: "thinking", signature: String, thinking: String}
      #   # Anthropic::Models::Beta::BetaThinkingBlock ...
      # in {type: "redacted_thinking", data: String}
      #   # Anthropic::Models::Beta::BetaRedactedThinkingBlock ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case beta_content_block
      # in Anthropic::Models::Beta::BetaTextBlock
      #   # ...
      # in Anthropic::Models::Beta::BetaToolUseBlock
      #   # ...
      # in Anthropic::Models::Beta::BetaThinkingBlock
      #   # ...
      # in Anthropic::Models::Beta::BetaRedactedThinkingBlock
      #   # ...
      # end
      # ```
      class BetaContentBlock < Anthropic::Union
        discriminator :type

        variant :text, -> { Anthropic::Models::Beta::BetaTextBlock }

        variant :tool_use, -> { Anthropic::Models::Beta::BetaToolUseBlock }

        variant :thinking, -> { Anthropic::Models::Beta::BetaThinkingBlock }

        variant :redacted_thinking, -> { Anthropic::Models::Beta::BetaRedactedThinkingBlock }
      end
    end

    BetaContentBlock = Beta::BetaContentBlock
  end
end
