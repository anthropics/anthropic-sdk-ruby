# typed: strong

module Anthropic
  module Models
    class ThinkingConfigParam < Anthropic::Union
      abstract!

      sig do
        override
          .returns(
            [[Symbol, Anthropic::Models::ThinkingConfigEnabled], [Symbol, Anthropic::Models::ThinkingConfigDisabled]]
          )
      end
      private_class_method def self.variants
      end
    end
  end
end
