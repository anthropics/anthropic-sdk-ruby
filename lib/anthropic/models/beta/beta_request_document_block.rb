# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRequestDocumentBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute source
        #
        #   @return [Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource, Anthropic::Models::Beta::BetaFileDocumentSource]
        required :source, union: -> { Anthropic::Beta::BetaRequestDocumentBlock::Source }

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
        optional :citations, -> { Anthropic::Beta::BetaCitationsConfigParam }, nil?: true

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
        #   @param citations [Anthropic::Models::Beta::BetaCitationsConfigParam, nil]
        #
        #   @param context [String, nil]
        #
        #   @param title [String, nil]
        #
        #   @param type [Symbol, :document]

        # @see Anthropic::Models::Beta::BetaRequestDocumentBlock#source
        module Source
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :base64, -> { Anthropic::Beta::BetaBase64PDFSource }

          variant :text, -> { Anthropic::Beta::BetaPlainTextSource }

          variant :content, -> { Anthropic::Beta::BetaContentBlockSource }

          variant :url, -> { Anthropic::Beta::BetaURLPDFSource }

          variant :file, -> { Anthropic::Beta::BetaFileDocumentSource }

          module Type
            extend Anthropic::Internal::Type::Enum

            BASE64 = :base64
            TEXT = :text
            CONTENT = :content
            URL = :url
            FILE = :file

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource, Anthropic::Models::Beta::BetaFileDocumentSource)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :data
          #
          #   @option args [Symbol, :"application/pdf", Symbol, :"text/plain"] :media_type
          #
          #   @option args [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>] :content
          #
          #   @option args [String] :url
          #
          #   @option args [String] :file_id
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource, Anthropic::Models::Beta::BetaFileDocumentSource]
          def self.new(type:, **args)
            case type.to_sym
            when :base64
              Anthropic::Beta::BetaBase64PDFSource.new(**args)
            when :text
              Anthropic::Beta::BetaPlainTextSource.new(**args)
            when :content
              Anthropic::Beta::BetaContentBlockSource.new(**args)
            when :url
              Anthropic::Beta::BetaURLPDFSource.new(**args)
            when :file
              Anthropic::Beta::BetaFileDocumentSource.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaRequestDocumentBlock = Beta::BetaRequestDocumentBlock
  end
end
