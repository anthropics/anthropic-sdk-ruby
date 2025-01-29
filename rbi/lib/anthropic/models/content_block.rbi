# typed: strong

module Anthropic
  module Models
    class ContentBlock < Anthropic::Union
      abstract!

      Variants = T.type_alias { T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock) }

      sig { returns([[Symbol, Anthropic::Models::TextBlock], [Symbol, Anthropic::Models::ToolUseBlock]]) }
      private_class_method def self.variants; end
    end
  end
end
