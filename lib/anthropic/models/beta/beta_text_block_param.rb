# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, :text]
        required :type, const: :text

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute citations
        #
        #   @return [Array<Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam>, nil]
        optional :citations,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Models::Beta::BetaTextCitationParam] },
                 nil?: true

        # @!method initialize(text:, cache_control: nil, citations: nil, type: :text)
        #   @param text [String]
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   @param citations [Array<Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam>, nil]
        #   @param type [Symbol, :text]
      end
    end

    BetaTextBlockParam = Beta::BetaTextBlockParam
  end
end
