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
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }, nil?: true

      # @!attribute citations
      #
      #   @return [Array<Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam>, nil]
      optional :citations,
               -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Models::TextCitationParam] },
               nil?: true

      # @!parse
      #   # @param text [String]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   # @param citations [Array<Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam>, nil]
      #   # @param type [Symbol, :text]
      #   #
      #   def initialize(text:, cache_control: nil, citations: nil, type: :text, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
