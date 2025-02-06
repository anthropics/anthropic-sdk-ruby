# typed: strong

module Anthropic
  module Models
    BetaTextCitation = T.type_alias { Beta::BetaTextCitation }

    module Beta
      class BetaTextCitation < Anthropic::Union
        abstract!

        sig do
          override.returns(
            [
              [Symbol, Anthropic::Models::Beta::BetaCitationCharLocation],
              [Symbol, Anthropic::Models::Beta::BetaCitationPageLocation],
              [Symbol, Anthropic::Models::Beta::BetaCitationContentBlockLocation]
            ]
          )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
