# typed: strong

module Anthropic
  module Models
    class MessageCountTokensTool < Anthropic::Union
      abstract!

      class << self
        sig do
          override
            .returns(
              [Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::ToolTextEditor20250124]
            )
        end
        def variants
        end
      end
    end
  end
end
