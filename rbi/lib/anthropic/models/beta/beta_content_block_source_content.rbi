# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaContentBlockSourceContent < Anthropic::Union
        abstract!

        Variants =
          type_template(:out) { {fixed: T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)} }
      end
    end

    BetaContentBlockSourceContent = Beta::BetaContentBlockSourceContent
  end
end
