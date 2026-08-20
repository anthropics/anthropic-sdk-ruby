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

        module Type
          extend Anthropic::Internal::Type::Enum

          BASE64 = :base64
          TEXT = :text

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource)]

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
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource]
        def self.new(type:, **args)
          case type.to_sym
          when :base64
            Anthropic::Base64PDFSource.new(**args)
          when :text
            Anthropic::PlainTextSource.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end
  end
end
