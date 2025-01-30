# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      #
      # @example
      # ```ruby
      # case beta_text_citation_param
      # in {type: "char_location", cited_text: String, document_index: Integer, document_title: String}
      #   # Anthropic::Models::Beta::BetaCitationCharLocationParam ...
      # in {type: "page_location", cited_text: String, document_index: Integer, document_title: String}
      #   # Anthropic::Models::Beta::BetaCitationPageLocationParam ...
      # in {type: "content_block_location", cited_text: String, document_index: Integer, document_title: String}
      #   # Anthropic::Models::Beta::BetaCitationContentBlockLocationParam ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case beta_text_citation_param
      # in Anthropic::Models::Beta::BetaCitationCharLocationParam
      #   # ...
      # in Anthropic::Models::Beta::BetaCitationPageLocationParam
      #   # ...
      # in Anthropic::Models::Beta::BetaCitationContentBlockLocationParam
      #   # ...
      # end
      # ```
      class BetaTextCitationParam < Anthropic::Union
        discriminator :type

        variant :char_location, -> { Anthropic::Models::Beta::BetaCitationCharLocationParam }

        variant :page_location, -> { Anthropic::Models::Beta::BetaCitationPageLocationParam }

        variant :content_block_location, -> { Anthropic::Models::Beta::BetaCitationContentBlockLocationParam }
      end
    end

    BetaTextCitationParam = Beta::BetaTextCitationParam
  end
end
