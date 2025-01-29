# typed: strong

module Anthropic
  module Models
    BetaTextCitation = T.type_alias { Beta::BetaTextCitation }

    module Beta
      class BetaTextCitation < Anthropic::Union
        abstract!

        Variants = T.type_alias do
          T.any(
            Anthropic::Models::Beta::BetaCitationCharLocation,
            Anthropic::Models::Beta::BetaCitationPageLocation,
            Anthropic::Models::Beta::BetaCitationContentBlockLocation
          )
        end

        sig do
          returns(
            [
              [Symbol, Anthropic::Models::Beta::BetaCitationCharLocation],
              [Symbol, Anthropic::Models::Beta::BetaCitationPageLocation],
              [Symbol, Anthropic::Models::Beta::BetaCitationContentBlockLocation]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end
