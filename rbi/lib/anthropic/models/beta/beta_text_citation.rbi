# typed: strong

module Anthropic
  module Models
    BetaTextCitation = T.type_alias { Beta::BetaTextCitation }

    module Beta
      class BetaTextCitation < Anthropic::Union
        abstract!

        class << self
          sig do
            override
              .returns(
                [[Symbol, Anthropic::Models::Beta::BetaCitationCharLocation], [Symbol, Anthropic::Models::Beta::BetaCitationPageLocation], [Symbol, Anthropic::Models::Beta::BetaCitationContentBlockLocation]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
