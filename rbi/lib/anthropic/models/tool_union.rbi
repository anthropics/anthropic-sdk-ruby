# typed: strong

module Anthropic
  module Models
    class ToolUnion < Anthropic::Union
      abstract!

      sig do
        override
          .returns(
            [[NilClass, Anthropic::Models::ToolBash20250124], [NilClass, Anthropic::Models::ToolTextEditor20250124], [NilClass, Anthropic::Models::Tool]]
          )
      end
      private_class_method def self.variants
      end
    end
  end
end
