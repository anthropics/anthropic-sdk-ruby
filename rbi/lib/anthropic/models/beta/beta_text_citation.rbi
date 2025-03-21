# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaTextCitation
        extend Anthropic::Union

        sig do
          override
            .returns(
              [Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation]
            )
        end
        def self.variants
        end
      end
    end

    BetaTextCitation = Beta::BetaTextCitation
  end
end
