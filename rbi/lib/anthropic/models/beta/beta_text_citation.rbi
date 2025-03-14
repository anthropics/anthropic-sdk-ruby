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
                [Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
