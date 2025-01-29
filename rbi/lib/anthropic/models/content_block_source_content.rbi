# typed: strong

module Anthropic
  module Models
    class ContentBlockSourceContent < Anthropic::Union
      abstract!

      Variants = T.type_alias { T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam) }

      sig do
        returns([[Symbol, Anthropic::Models::TextBlockParam], [Symbol, Anthropic::Models::ImageBlockParam]])
      end
      private_class_method def self.variants; end
    end
  end
end
