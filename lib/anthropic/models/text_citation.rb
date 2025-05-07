# frozen_string_literal: true

module Anthropic
  module Models
    module TextCitation
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :char_location, -> { Anthropic::CitationCharLocation }

      variant :page_location, -> { Anthropic::CitationPageLocation }

      variant :content_block_location, -> { Anthropic::CitationContentBlockLocation }

      # @!method self.variants
      #   @return [Array(Anthropic::CitationCharLocation, Anthropic::CitationPageLocation, Anthropic::CitationContentBlockLocation)]
    end
  end
end
