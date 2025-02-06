# typed: strong

module Anthropic
  module Models
    class ContentBlockSourceContent < Anthropic::Union
      abstract!

      sig do
        override.returns(
          [
            [Symbol, Anthropic::Models::TextBlockParam],
            [Symbol, Anthropic::Models::ImageBlockParam]
          ]
        )
      end
      private_class_method def self.variants
      end
    end
  end
end
