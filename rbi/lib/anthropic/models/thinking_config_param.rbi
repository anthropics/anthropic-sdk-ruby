# typed: strong

module Anthropic
  module Models
    class ThinkingConfigParam < Anthropic::Union
      abstract!

      class << self
        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::ThinkingConfigEnabled], [Symbol, Anthropic::Models::ThinkingConfigDisabled]]
            )
        end
        private def variants
        end
      end
    end
  end
end
