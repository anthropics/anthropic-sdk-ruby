# typed: strong

module Anthropic
  module Models
    BetaTextCitation = T.type_alias { Beta::BetaTextCitation }

    module Beta
      class BetaTextCitation < Anthropic::Union
        abstract!

        Variants = type_template(:out) do
          {
            fixed: T.any(
              Anthropic::Models::Beta::BetaCitationCharLocation,
              Anthropic::Models::Beta::BetaCitationPageLocation,
              Anthropic::Models::Beta::BetaCitationContentBlockLocation
            )
          }
        end
      end
    end
  end
end
