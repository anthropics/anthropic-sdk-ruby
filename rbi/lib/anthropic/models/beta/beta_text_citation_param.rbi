# typed: strong

module Anthropic
  module Models
    BetaTextCitationParam = T.type_alias { Beta::BetaTextCitationParam }

    module Beta
      class BetaTextCitationParam < Anthropic::Union
        abstract!

        Variants = type_template(:out) do
          {
            fixed: T.any(
              Anthropic::Models::Beta::BetaCitationCharLocationParam,
              Anthropic::Models::Beta::BetaCitationPageLocationParam,
              Anthropic::Models::Beta::BetaCitationContentBlockLocationParam
            )
          }
        end
      end
    end
  end
end
