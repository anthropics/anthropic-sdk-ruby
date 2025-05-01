# typed: strong

module Anthropic
  module Models
    BetaTextCitation = Beta::BetaTextCitation

    module Beta
      module BetaTextCitation
        extend Anthropic::Internal::Type::Union

        sig do
          override
            .returns(
              [Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation]
            )
        end
        def self.variants; end
      end
    end
  end
end
