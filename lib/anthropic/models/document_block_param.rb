# frozen_string_literal: true

module Anthropic
  module Models
    class DocumentBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Base64PDFSource, Anthropic::PlainTextSource, Anthropic::ContentBlockSource, Anthropic::URLPDFSource]
      required :source, union: -> { Anthropic::DocumentBlockParam::Source }

      # @!attribute type
      #
      #   @return [Symbol, :document]
      required :type, const: :document

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute citations
      #
      #   @return [Anthropic::CitationsConfigParam, nil]
      optional :citations, -> { Anthropic::CitationsConfigParam }

      # @!attribute context
      #
      #   @return [String, nil]
      optional :context, String, nil?: true

      # @!attribute title
      #
      #   @return [String, nil]
      optional :title, String, nil?: true

      # @!method initialize(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document)
      #   @param source [Anthropic::Base64PDFSource, Anthropic::PlainTextSource, Anthropic::ContentBlockSource, Anthropic::URLPDFSource]
      #
      #   @param cache_control [Anthropic::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param citations [Anthropic::CitationsConfigParam]
      #
      #   @param context [String, nil]
      #
      #   @param title [String, nil]
      #
      #   @param type [Symbol, :document]

      # @see Anthropic::DocumentBlockParam#source
      module Source
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :base64, -> { Anthropic::Base64PDFSource }

        variant :text, -> { Anthropic::PlainTextSource }

        variant :content, -> { Anthropic::ContentBlockSource }

        variant :url, -> { Anthropic::URLPDFSource }

        # @!method self.variants
        #   @return [Array(Anthropic::Base64PDFSource, Anthropic::PlainTextSource, Anthropic::ContentBlockSource, Anthropic::URLPDFSource)]
      end
    end
  end
end
