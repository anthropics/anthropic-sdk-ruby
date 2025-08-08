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

      variant :search_result_location, -> { Anthropic::CitationsSearchResultLocation }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation, Anthropic::Models::CitationsWebSearchResultLocation, Anthropic::Models::CitationsSearchResultLocation)]
    end
  end
end
