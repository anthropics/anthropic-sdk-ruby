# typed: strong

module Anthropic
  module Models
    class ToolUnion < Anthropic::Union
      abstract!

      class << self
        # @api private
        sig do
          override
            .returns(
              [[NilClass, Anthropic::Models::Tool], [NilClass, Anthropic::Models::ToolBash20250124], [NilClass, Anthropic::Models::ToolTextEditor20250124]]
            )
        end
        private def variants
        end
      end
    end
  end
end
