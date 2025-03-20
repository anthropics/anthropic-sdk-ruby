# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaTextCitation
        extend Anthropic::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Anthropic::Models::Beta::BetaCitationCharLocation,
                Anthropic::Models::Beta::BetaCitationPageLocation,
                Anthropic::Models::Beta::BetaCitationContentBlockLocation
              )
            }
          end

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

    BetaTextCitation = Beta::BetaTextCitation
  end
end
