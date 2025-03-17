# typed: strong

module Anthropic
  module Models
    class AnthropicBeta < Anthropic::Union
      abstract!

      Variants = type_template(:out) { {fixed: T.any(String, Symbol)} }
    end
  end
end
