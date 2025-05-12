# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBase64PDFBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute source
        #
        #   @return [Anthropic::Beta::BetaBase64PDFSource, Anthropic::Beta::BetaPlainTextSource, Anthropic::Beta::BetaContentBlockSource, Anthropic::Beta::BetaURLPDFSource]
        required :source, union: -> { Anthropic::Beta::BetaBase64PDFBlock::Source }

        # @!attribute type
        #
        #   @return [Symbol, :document]
        required :type, const: :document

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute citations
        #
        #   @return [Anthropic::Beta::BetaCitationsConfigParam, nil]
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
        #   @param source [Anthropic::Beta::BetaBase64PDFSource, Anthropic::Beta::BetaPlainTextSource, Anthropic::Beta::BetaContentBlockSource, Anthropic::Beta::BetaURLPDFSource]
        #
        #   @param cache_control [Anthropic::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param citations [Anthropic::Beta::BetaCitationsConfigParam]
        #
        #   @param context [String, nil]
        #
        #   @param title [String, nil]
        #
        #   @param type [Symbol, :document]

        # @see Anthropic::Beta::BetaBase64PDFBlock#source
        module Source
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :base64, -> { Anthropic::Beta::BetaBase64PDFSource }

          variant :text, -> { Anthropic::Beta::BetaPlainTextSource }

          variant :content, -> { Anthropic::Beta::BetaContentBlockSource }

          variant :url, -> { Anthropic::Beta::BetaURLPDFSource }

          # @!method self.variants
          #   @return [Array(Anthropic::Beta::BetaBase64PDFSource, Anthropic::Beta::BetaPlainTextSource, Anthropic::Beta::BetaContentBlockSource, Anthropic::Beta::BetaURLPDFSource)]

          define_sorbet_constant!(:Variants) do
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaBase64PDFSource,
                Anthropic::Beta::BetaPlainTextSource,
                Anthropic::Beta::BetaContentBlockSource,
                Anthropic::Beta::BetaURLPDFSource
              )
            end
          end
        end
      end
    end

    BetaBase64PDFBlock = Beta::BetaBase64PDFBlock
  end
end
