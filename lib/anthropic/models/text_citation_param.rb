# frozen_string_literal: true

module Anthropic
  module Models
    module TextCitationParam
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :char_location, -> { Anthropic::Models::CitationCharLocationParam }

      variant :page_location, -> { Anthropic::Models::CitationPageLocationParam }

      variant :content_block_location, -> { Anthropic::Models::CitationContentBlockLocationParam }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam)]
    end
  end
end
