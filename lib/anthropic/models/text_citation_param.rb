# frozen_string_literal: true

module Anthropic
  module Models
    module TextCitationParam
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :char_location, -> { Anthropic::CitationCharLocationParam }

      variant :page_location, -> { Anthropic::CitationPageLocationParam }

      variant :content_block_location, -> { Anthropic::CitationContentBlockLocationParam }

      variant :web_search_result_location, -> { Anthropic::CitationWebSearchResultLocationParam }

      # @!method self.variants
      #   @return [Array(Anthropic::CitationCharLocationParam, Anthropic::CitationPageLocationParam, Anthropic::CitationContentBlockLocationParam, Anthropic::CitationWebSearchResultLocationParam)]
    end
  end
end
