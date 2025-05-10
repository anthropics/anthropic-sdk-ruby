# typed: strong

module Anthropic
  module Models
    BetaRawContentBlockDelta = Beta::BetaRawContentBlockDelta

    module Beta
      module BetaRawContentBlockDelta
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextDelta,
              Anthropic::Beta::BetaInputJSONDelta,
              Anthropic::Beta::BetaCitationsDelta,
              Anthropic::Beta::BetaThinkingDelta,
              Anthropic::Beta::BetaSignatureDelta
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaRawContentBlockDelta::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
