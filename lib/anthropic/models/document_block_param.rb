# frozen_string_literal: true

module Anthropic
  module Models
    class DocumentBlockParam < Anthropic::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource]
      required :source, union: -> { Anthropic::Models::DocumentBlockParam::Source }

      # @!attribute type
      #
      #   @return [Symbol, :document]
      required :type, const: :document

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }, nil?: true

      # @!attribute [r] citations
      #
      #   @return [Anthropic::Models::CitationsConfigParam, nil]
      optional :citations, -> { Anthropic::Models::CitationsConfigParam }

      # @!parse
      #   # @return [Anthropic::Models::CitationsConfigParam]
      #   attr_writer :citations

      # @!attribute context
      #
      #   @return [String, nil]
      optional :context, String, nil?: true

      # @!attribute title
      #
      #   @return [String, nil]
      optional :title, String, nil?: true

      # @!parse
      #   # @param source [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   # @param citations [Anthropic::Models::CitationsConfigParam]
      #   # @param context [String, nil]
      #   # @param title [String, nil]
      #   # @param type [Symbol, :document]
      #   #
      #   def initialize(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @see Anthropic::Models::DocumentBlockParam#source
      module Source
        extend Anthropic::Union

        discriminator :type

        variant :base64, -> { Anthropic::Models::Base64PDFSource }

        variant :text, -> { Anthropic::Models::PlainTextSource }

        variant :content, -> { Anthropic::Models::ContentBlockSource }

        variant :url, -> { Anthropic::Models::URLPDFSource }

        # @!parse
        #   # @return [Array(Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource)]
        #   def self.variants; end
      end
    end
  end
end
