# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaRawContentBlockDelta
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text_delta, -> { Anthropic::Models::Beta::BetaTextDelta }

        variant :input_json_delta, -> { Anthropic::Models::Beta::BetaInputJSONDelta }

        variant :citations_delta, -> { Anthropic::Models::Beta::BetaCitationsDelta }

        variant :thinking_delta, -> { Anthropic::Models::Beta::BetaThinkingDelta }

        variant :signature_delta, -> { Anthropic::Models::Beta::BetaSignatureDelta }

        # @!parse
        #   # @return [Array(Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaCitationsDelta, Anthropic::Models::Beta::BetaThinkingDelta, Anthropic::Models::Beta::BetaSignatureDelta)]
        #   def self.variants; end
      end
    end

    BetaRawContentBlockDelta = Beta::BetaRawContentBlockDelta
  end
end
