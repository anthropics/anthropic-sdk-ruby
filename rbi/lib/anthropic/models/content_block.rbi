# typed: strong

module Anthropic
  module Models
    class ContentBlock < Anthropic::Union
      abstract!

      sig { override.returns([[Symbol, Anthropic::Models::TextBlock], [Symbol, Anthropic::Models::ToolUseBlock]]) }
      private_class_method def self.variants
      end
    end
  end
end
