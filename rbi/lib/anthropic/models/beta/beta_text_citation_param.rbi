# typed: strong

module Anthropic
  module Models
    BetaTextCitationParam = T.type_alias { Beta::BetaTextCitationParam }

    module Beta
      class BetaTextCitationParam < Anthropic::Union
        abstract!

        Variants = T.type_alias do
          T.any(
            Anthropic::Models::Beta::BetaCitationCharLocationParam,
            Anthropic::Models::Beta::BetaCitationPageLocationParam,
            Anthropic::Models::Beta::BetaCitationContentBlockLocationParam
          )
        end

        sig do
          returns(
            [
              [Symbol, Anthropic::Models::Beta::BetaCitationCharLocationParam],
              [Symbol, Anthropic::Models::Beta::BetaCitationPageLocationParam],
              [Symbol, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end
