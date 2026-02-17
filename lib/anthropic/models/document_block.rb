# frozen_string_literal: true

module Anthropic
  module Models
    class DocumentBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute citations
      #   Citation configuration for the document
      #
      #   @return [Anthropic::Models::CitationsConfig, nil]
      required :citations, -> { Anthropic::CitationsConfig }, nil?: true

      # @!attribute source
      #
      #   @return [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource]
      required :source, union: -> { Anthropic::DocumentBlock::Source }

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
      #   @param citations [Anthropic::Models::CitationsConfig, nil] Citation configuration for the document
      #
      #   @param source [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource]
      #
      #   @param title [String, nil] The title of the document
      #
      #   @param type [Symbol, :document]

      # @see Anthropic::Models::DocumentBlock#source
      module Source
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :base64, -> { Anthropic::Base64PDFSource }

        variant :text, -> { Anthropic::PlainTextSource }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource)]
      end
    end
  end
end
