# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaRawContentBlockDelta
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text_delta, -> { Anthropic::Beta::BetaTextDelta }

        variant :input_json_delta, -> { Anthropic::Beta::BetaInputJSONDelta }

        variant :citations_delta, -> { Anthropic::Beta::BetaCitationsDelta }

        variant :thinking_delta, -> { Anthropic::Beta::BetaThinkingDelta }

        variant :signature_delta, -> { Anthropic::Beta::BetaSignatureDelta }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaCitationsDelta, Anthropic::Models::Beta::BetaThinkingDelta, Anthropic::Models::Beta::BetaSignatureDelta)]
      end
    end

    BetaRawContentBlockDelta = Beta::BetaRawContentBlockDelta
  end
end
