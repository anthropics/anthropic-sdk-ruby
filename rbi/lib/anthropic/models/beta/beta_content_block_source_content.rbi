# typed: strong

module Anthropic
  module Models
    BetaContentBlockSourceContent = T.type_alias { Beta::BetaContentBlockSourceContent }

    module Beta
      class BetaContentBlockSourceContent < Anthropic::Union
        abstract!

        Variants = type_template(:out) { {fixed: T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)} }
      end
    end
  end
end
