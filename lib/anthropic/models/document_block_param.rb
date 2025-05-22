# frozen_string_literal: true

module Anthropic
  module Models
    class DocumentBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource]
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
      #   @param source [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param citations [Anthropic::Models::CitationsConfigParam]
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

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource)]
      end
    end
  end
end
