# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # case beta_text_citation
      # in {type: "char_location", cited_text: String, document_index: Integer, document_title: String}
      #   # Anthropic::Models::Beta::BetaCitationCharLocation ...
      # in {type: "page_location", cited_text: String, document_index: Integer, document_title: String}
      #   # Anthropic::Models::Beta::BetaCitationPageLocation ...
      # in {type: "content_block_location", cited_text: String, document_index: Integer, document_title: String}
      #   # Anthropic::Models::Beta::BetaCitationContentBlockLocation ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case beta_text_citation
      # in Anthropic::Models::Beta::BetaCitationCharLocation
      #   # ...
      # in Anthropic::Models::Beta::BetaCitationPageLocation
      #   # ...
      # in Anthropic::Models::Beta::BetaCitationContentBlockLocation
      #   # ...
      # end
      # ```
      class BetaTextCitation < Anthropic::Union
        discriminator :type

        variant :char_location, -> { Anthropic::Models::Beta::BetaCitationCharLocation }

        variant :page_location, -> { Anthropic::Models::Beta::BetaCitationPageLocation }

        variant :content_block_location, -> { Anthropic::Models::Beta::BetaCitationContentBlockLocation }
      end
    end

    BetaTextCitation = Beta::BetaTextCitation
  end
end
