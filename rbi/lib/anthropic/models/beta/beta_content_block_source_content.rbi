# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaContentBlockSourceContent
        extend Anthropic::Union

        Variants =
          type_template(:out) { {fixed: T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)} }
      end
    end

    BetaContentBlockSourceContent = Beta::BetaContentBlockSourceContent
  end
end
