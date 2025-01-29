# typed: strong

module Anthropic
  module Models
    class ContentBlockParam < Anthropic::Union
      abstract!

      Variants = T.type_alias do
        T.any(
          Anthropic::Models::TextBlockParam,
          Anthropic::Models::ImageBlockParam,
          Anthropic::Models::ToolUseBlockParam,
          Anthropic::Models::ToolResultBlockParam,
          Anthropic::Models::DocumentBlockParam
        )
      end

      sig do
        returns(
          [
            [Symbol, Anthropic::Models::TextBlockParam],
            [Symbol, Anthropic::Models::ImageBlockParam],
            [Symbol, Anthropic::Models::ToolUseBlockParam],
            [Symbol, Anthropic::Models::ToolResultBlockParam],
            [Symbol, Anthropic::Models::DocumentBlockParam]
          ]
        )
      end
      private_class_method def self.variants; end
    end
  end
end
