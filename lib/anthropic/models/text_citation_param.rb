# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    #
    class TextCitationParam < Anthropic::Union
      discriminator :type

      variant :char_location, -> { Anthropic::Models::CitationCharLocationParam }

      variant :page_location, -> { Anthropic::Models::CitationPageLocationParam }

      variant :content_block_location, -> { Anthropic::Models::CitationContentBlockLocationParam }
    end
  end
end
