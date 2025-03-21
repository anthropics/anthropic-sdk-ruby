# frozen_string_literal: true

module Anthropic
  module Models
    module TextCitationParam
      extend Anthropic::Union

      discriminator :type

      variant :char_location, -> { Anthropic::Models::CitationCharLocationParam }

      variant :page_location, -> { Anthropic::Models::CitationPageLocationParam }

      variant :content_block_location, -> { Anthropic::Models::CitationContentBlockLocationParam }

      # @!parse
      #   # @return [Array(Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam)]
      #   def self.variants; end
    end
  end
end
