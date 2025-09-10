# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDocumentBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute citations
        #   Citation configuration for the document
        #
        #   @return [Anthropic::Models::Beta::BetaCitationConfig, nil]
        required :citations, -> { Anthropic::Beta::BetaCitationConfig }, nil?: true

        # @!attribute source
        #
        #   @return [Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource]
        required :source, union: -> { Anthropic::Beta::BetaDocumentBlock::Source }

        # @!attribute title
        #   The title of the document
        #
        #   @return [String, nil]
        required :title, String, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :document]
        required :type, const: :document

        # @!method initialize(citations:, source:, title:, type: :document)
        #   @param citations [Anthropic::Models::Beta::BetaCitationConfig, nil] Citation configuration for the document
        #
        #   @param source [Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource]
        #
        #   @param title [String, nil] The title of the document
        #
        #   @param type [Symbol, :document]

        # @see Anthropic::Models::Beta::BetaDocumentBlock#source
        module Source
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :base64, -> { Anthropic::Beta::BetaBase64PDFSource }

          variant :text, -> { Anthropic::Beta::BetaPlainTextSource }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource)]
        end
      end
    end

    BetaDocumentBlock = Beta::BetaDocumentBlock
  end
end
