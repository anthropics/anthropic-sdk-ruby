# frozen_string_literal: true

module Anthropic
  module Models
    module TextCitation
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :char_location, -> { Anthropic::CitationCharLocation }

      variant :page_location, -> { Anthropic::CitationPageLocation }

      variant :content_block_location, -> { Anthropic::CitationContentBlockLocation }

      variant :web_search_result_location, -> { Anthropic::CitationsWebSearchResultLocation }

      # @!method self.variants
      #   @return [Array(Anthropic::CitationCharLocation, Anthropic::CitationPageLocation, Anthropic::CitationContentBlockLocation, Anthropic::CitationsWebSearchResultLocation)]

      define_sorbet_constant!(:Variants) do
        T.type_alias do
          T.any(
            Anthropic::CitationCharLocation,
            Anthropic::CitationPageLocation,
            Anthropic::CitationContentBlockLocation,
            Anthropic::CitationsWebSearchResultLocation
          )
        end
      end
    end
  end
end
