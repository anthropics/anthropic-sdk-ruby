# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaSearchResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Array<Anthropic::Models::Beta::BetaTextBlockParam>]
        required :content, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaTextBlockParam] }

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
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute citations
        #
        #   @return [Anthropic::Models::Beta::BetaCitationsConfigParam, nil]
        optional :citations, -> { Anthropic::Beta::BetaCitationsConfigParam }

        # @!method initialize(content:, source:, title:, cache_control: nil, citations: nil, type: :search_result)
        #   @param content [Array<Anthropic::Models::Beta::BetaTextBlockParam>]
        #
        #   @param source [String]
        #
        #   @param title [String]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param citations [Anthropic::Models::Beta::BetaCitationsConfigParam]
        #
        #   @param type [Symbol, :search_result]
      end
    end

    BetaSearchResultBlockParam = Beta::BetaSearchResultBlockParam
  end
end
