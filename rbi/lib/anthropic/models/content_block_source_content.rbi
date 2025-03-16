# typed: strong

module Anthropic
  module Models
    class ContentBlockSourceContent < Anthropic::Union
      abstract!

      Variants = type_template(:out) { {fixed: T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)} }
    end
  end
end
