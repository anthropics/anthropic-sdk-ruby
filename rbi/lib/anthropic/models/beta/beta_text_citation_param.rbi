# typed: strong

module Anthropic
  module Models
    BetaTextCitationParam = T.type_alias { Beta::BetaTextCitationParam }

    module Beta
      class BetaTextCitationParam < Anthropic::Union
        abstract!

        class << self
          sig do
            override
              .returns(
                [Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
