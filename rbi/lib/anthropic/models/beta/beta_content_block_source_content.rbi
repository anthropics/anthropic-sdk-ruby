# typed: strong

module Anthropic
  module Models
    BetaContentBlockSourceContent = T.type_alias { Beta::BetaContentBlockSourceContent }

    module Beta
      class BetaContentBlockSourceContent < Anthropic::Union
        abstract!

        sig do
          override.returns(
            [
              [Symbol, Anthropic::Models::Beta::BetaTextBlockParam],
              [Symbol, Anthropic::Models::Beta::BetaImageBlockParam]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end
