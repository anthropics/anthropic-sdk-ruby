# frozen_string_literal: true

module Anthropic
  module Models
    class SearchResultBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Array<Anthropic::Models::TextBlockParam>]
      required :content, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::TextBlockParam] }

      # @!attribute source
      #
      #   @return [String]
      required :source, String

      # @!attribute title
      #
      #   @return [String]
      required :title, String

      # @!attribute type
      #
      #   @return [Symbol, :search_result]
      required :type, const: :search_result

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute citations
      #
      #   @return [Anthropic::Models::CitationsConfigParam, nil]
      optional :citations, -> { Anthropic::CitationsConfigParam }

      # @!method initialize(content:, source:, title:, cache_control: nil, citations: nil, type: :search_result)
      #   @param content [Array<Anthropic::Models::TextBlockParam>]
      #
      #   @param source [String]
      #
      #   @param title [String]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param citations [Anthropic::Models::CitationsConfigParam]
      #
      #   @param type [Symbol, :search_result]
    end
  end
end
