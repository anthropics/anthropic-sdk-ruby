# typed: strong

module Anthropic
  module Models
    BetaRawContentBlockDelta = Beta::BetaRawContentBlockDelta

    module Beta
      module BetaRawContentBlockDelta
        extend Anthropic::Internal::Type::Union

        sig do
          override
            .returns(
              [Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaCitationsDelta, Anthropic::Models::Beta::BetaThinkingDelta, Anthropic::Models::Beta::BetaSignatureDelta]
            )
        end
        def self.variants; end
      end
    end
  end
end
