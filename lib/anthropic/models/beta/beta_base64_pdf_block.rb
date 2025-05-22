# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBase64PDFBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute source
        #
        #   @return [Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource, Anthropic::Models::Beta::BetaFileDocumentSource]
        required :source, union: -> { Anthropic::Beta::BetaBase64PDFBlock::Source }

        # @!attribute type
        #
        #   @return [Symbol, :document]
        required :type, const: :document

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute citations
        #
        #   @return [Anthropic::Models::Beta::BetaCitationsConfigParam, nil]
        optional :citations, -> { Anthropic::Beta::BetaCitationsConfigParam }

        # @!attribute context
        #
        #   @return [String, nil]
        optional :context, String, nil?: true

        # @!attribute title
        #
        #   @return [String, nil]
        optional :title, String, nil?: true

        # @!method initialize(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document)
        #   @param source [Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource, Anthropic::Models::Beta::BetaFileDocumentSource]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param citations [Anthropic::Models::Beta::BetaCitationsConfigParam]
        #
        #   @param context [String, nil]
        #
        #   @param title [String, nil]
        #
        #   @param type [Symbol, :document]

        # @see Anthropic::Models::Beta::BetaBase64PDFBlock#source
        module Source
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :base64, -> { Anthropic::Beta::BetaBase64PDFSource }

          variant :text, -> { Anthropic::Beta::BetaPlainTextSource }

          variant :content, -> { Anthropic::Beta::BetaContentBlockSource }

          variant :url, -> { Anthropic::Beta::BetaURLPDFSource }

          variant :file, -> { Anthropic::Beta::BetaFileDocumentSource }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource, Anthropic::Models::Beta::BetaFileDocumentSource)]
        end
      end
    end

    BetaBase64PDFBlock = Beta::BetaBase64PDFBlock
  end
end
