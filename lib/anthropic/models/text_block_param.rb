# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # text_block_param => {
    #   text: String,
    #   type: Anthropic::Models::TextBlockParam::Type,
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
      #   @return [Symbol, Anthropic::Models::TextBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::TextBlockParam::Type }

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
      #   # @param type [String]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   # @param citations [Array<Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam>]
      #   #
      #   def initialize(text:, type:, cache_control: nil, citations: nil, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case type
      # in :text
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        TEXT = :text

        finalize!
      end
    end
  end
end
