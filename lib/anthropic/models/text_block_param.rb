# frozen_string_literal: true

module Anthropic
  module Models
    class TextBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute text
      #
      #   @return [String]
      required :text, String

      # @!attribute type
      #
      #   @return [Symbol, :text]
      required :type, const: :text

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute citations
      #
      #   @return [Array<Anthropic::CitationCharLocationParam, Anthropic::CitationPageLocationParam, Anthropic::CitationContentBlockLocationParam, Anthropic::CitationWebSearchResultLocationParam>, nil]
      optional :citations,
               -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::TextCitationParam] },
               nil?: true

      # @!method initialize(text:, cache_control: nil, citations: nil, type: :text)
      #   @param text [String]
      #
      #   @param cache_control [Anthropic::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param citations [Array<Anthropic::CitationCharLocationParam, Anthropic::CitationPageLocationParam, Anthropic::CitationContentBlockLocationParam, Anthropic::CitationWebSearchResultLocationParam>, nil]
      #
      #   @param type [Symbol, :text]
    end
  end
end
