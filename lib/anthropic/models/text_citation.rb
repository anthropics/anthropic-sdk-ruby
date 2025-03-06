# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    #
    class TextCitation < Anthropic::Union
      discriminator :type

      variant :char_location, -> { Anthropic::Models::CitationCharLocation }

      variant :page_location, -> { Anthropic::Models::CitationPageLocation }

      variant :content_block_location, -> { Anthropic::Models::CitationContentBlockLocation }
    end
  end
end
