# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # text_block_param => {
    #   text: String,
    #   type: :text,
    #   cache_control: Anthropic::Models::CacheControlEphemeral,
    #   citations: -> { Anthropic::ArrayOf[union: Anthropic::Models::TextCitationParam] === _1 }
    # }
    # ```
    class TextBlockParam < Anthropic::BaseModel
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
      #   @return [Array<Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam>]
      optional :citations, -> { Anthropic::ArrayOf[union: Anthropic::Models::TextCitationParam] }, nil?: true

      # @!parse
      #   # @param text [String]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   # @param citations [Array<Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam>]
      #   # @param type [String]
      #   #
      #   def initialize(text:, cache_control: nil, citations: nil, type: :text, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
