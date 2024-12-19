# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # case union
    # in Anthropic::Models::TextBlockParam
    #   # ...
    # in Anthropic::Models::ImageBlockParam
    #   # ...
    # in Anthropic::Models::ToolUseBlockParam
    #   # ...
    # in Anthropic::Models::ToolResultBlockParam
    #   # ...
    # in Anthropic::Models::DocumentBlockParam
    #   # ...
    # end
    # ```
    class ContentBlockParam < Anthropic::Union
      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlockParam }

      variant :image, -> { Anthropic::Models::ImageBlockParam }

      variant :tool_use, -> { Anthropic::Models::ToolUseBlockParam }

      variant :tool_result, -> { Anthropic::Models::ToolResultBlockParam }

      variant :document, -> { Anthropic::Models::DocumentBlockParam }
    end
  end
end
