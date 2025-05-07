# frozen_string_literal: true

module Anthropic
  module Models
    module TextCitationParam
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :char_location, -> { Anthropic::CitationCharLocationParam }

      variant :page_location, -> { Anthropic::CitationPageLocationParam }

      variant :content_block_location, -> { Anthropic::CitationContentBlockLocationParam }

      # @!method self.variants
      #   @return [Array(Anthropic::CitationCharLocationParam, Anthropic::CitationPageLocationParam, Anthropic::CitationContentBlockLocationParam)]
    end
  end
end
