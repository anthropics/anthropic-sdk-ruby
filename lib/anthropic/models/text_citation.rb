# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    class TextCitation < Anthropic::Union
      discriminator :type

      variant :char_location, -> { Anthropic::Models::CitationCharLocation }

      variant :page_location, -> { Anthropic::Models::CitationPageLocation }

      variant :content_block_location, -> { Anthropic::Models::CitationContentBlockLocation }

      # @!parse
      #   class << self
      #     # @return [Array(Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation)]
      #     def variants; end
      #   end
    end
  end
end
