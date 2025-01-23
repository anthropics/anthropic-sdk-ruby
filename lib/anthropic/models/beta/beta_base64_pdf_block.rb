# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_base64_pdf_block => {
      #   source: Anthropic::Models::Beta::BetaBase64PDFBlock::Source,
      #   type: Anthropic::Models::Beta::BetaBase64PDFBlock::Type,
      #   cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral,
      #   citations: Anthropic::Models::Beta::BetaCitationsConfigParam,
      #   context: String
      # }
      # ```
      class BetaBase64PDFBlock < Anthropic::BaseModel
        # @!attribute source
        #
        #   @return [Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource]
        required :source, union: -> { Anthropic::Models::Beta::BetaBase64PDFBlock::Source }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaBase64PDFBlock::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaBase64PDFBlock::Type }

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute [r] citations
        #
        #   @return [Anthropic::Models::Beta::BetaCitationsConfigParam, nil]
        optional :citations, -> { Anthropic::Models::Beta::BetaCitationsConfigParam }

        # @!parse
        #   # @return [Anthropic::Models::Beta::BetaCitationsConfigParam]
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
        #   # @param source [Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource]
        #   # @param type [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param citations [Anthropic::Models::Beta::BetaCitationsConfigParam]
        #   # @param context [String, nil]
        #   # @param title [String, nil]
        #   #
        #   def initialize(source:, type:, cache_control: nil, citations: nil, context: nil, title: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case source
        # in {type: "base64", data: String, media_type: Anthropic::Models::Beta::BetaBase64PDFSource::MediaType}
        #   # Anthropic::Models::Beta::BetaBase64PDFSource ...
        # in {type: "text", data: String, media_type: Anthropic::Models::Beta::BetaPlainTextSource::MediaType}
        #   # Anthropic::Models::Beta::BetaPlainTextSource ...
        # in {type: "content", content: Anthropic::Models::Beta::BetaContentBlockSource::Content}
        #   # Anthropic::Models::Beta::BetaContentBlockSource ...
        # end
        # ```
        #
        # @example
        # ```ruby
        # case source
        # in Anthropic::Models::Beta::BetaBase64PDFSource
        #   # ...
        # in Anthropic::Models::Beta::BetaPlainTextSource
        #   # ...
        # in Anthropic::Models::Beta::BetaContentBlockSource
        #   # ...
        # end
        # ```
        class Source < Anthropic::Union
          discriminator :type

          variant :base64, -> { Anthropic::Models::Beta::BetaBase64PDFSource }

          variant :text, -> { Anthropic::Models::Beta::BetaPlainTextSource }

          variant :content, -> { Anthropic::Models::Beta::BetaContentBlockSource }
        end

        # @example
        # ```ruby
        # case type
        # in :document
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          DOCUMENT = :document

          finalize!
        end
      end
    end

    BetaBase64PDFBlock = Beta::BetaBase64PDFBlock
  end
end
