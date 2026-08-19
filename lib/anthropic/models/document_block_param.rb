# frozen_string_literal: true

module Anthropic
  module Models
    class DocumentBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource, Anthropic::Models::FileDocumentSource]
      required :source, union: -> { Anthropic::DocumentBlockParam::Source }

      # @!attribute type
      #
      #   @return [Symbol, :document]
      required :type, const: :document

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute citations
      #
      #   @return [Anthropic::Models::CitationsConfigParam, nil]
      optional :citations, -> { Anthropic::CitationsConfigParam }, nil?: true

      # @!attribute context
      #
      #   @return [String, nil]
      optional :context, String, nil?: true

      # @!attribute title
      #
      #   @return [String, nil]
      optional :title, String, nil?: true

      # @!method initialize(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document)
      #   @param source [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource, Anthropic::Models::FileDocumentSource]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param citations [Anthropic::Models::CitationsConfigParam, nil]
      #
      #   @param context [String, nil]
      #
      #   @param title [String, nil]
      #
      #   @param type [Symbol, :document]

      # @see Anthropic::Models::DocumentBlockParam#source
      module Source
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :base64, -> { Anthropic::Base64PDFSource }

        variant :text, -> { Anthropic::PlainTextSource }

        variant :content, -> { Anthropic::ContentBlockSource }

        variant :url, -> { Anthropic::URLPDFSource }

        variant :file, -> { Anthropic::FileDocumentSource }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource, Anthropic::Models::FileDocumentSource)]

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
        #   @option args [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>] :content
        #
        #   @option args [String] :url
        #
        #   @option args [String] :file_id
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource, Anthropic::Models::FileDocumentSource]
        def self.new(type:, **args)
          case type.to_sym
          when :base64
            Anthropic::Base64PDFSource.new(**args)
          when :text
            Anthropic::PlainTextSource.new(**args)
          when :content
            Anthropic::ContentBlockSource.new(**args)
          when :url
            Anthropic::URLPDFSource.new(**args)
          when :file
            Anthropic::FileDocumentSource.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end
  end
end
