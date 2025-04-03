# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBase64PDFBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute source
        #
        #   @return [Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource]
        required :source, union: -> { Anthropic::Models::Beta::BetaBase64PDFBlock::Source }

        # @!attribute type
        #
        #   @return [Symbol, :document]
        required :type, const: :document

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
        #   # @param source [Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param citations [Anthropic::Models::Beta::BetaCitationsConfigParam]
        #   # @param context [String, nil]
        #   # @param title [String, nil]
        #   # @param type [Symbol, :document]
        #   #
        #   def initialize(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document, **) = super

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void

        # @see Anthropic::Models::Beta::BetaBase64PDFBlock#source
        module Source
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :base64, -> { Anthropic::Models::Beta::BetaBase64PDFSource }

          variant :text, -> { Anthropic::Models::Beta::BetaPlainTextSource }

          variant :content, -> { Anthropic::Models::Beta::BetaContentBlockSource }

          variant :url, -> { Anthropic::Models::Beta::BetaURLPDFSource }

          # @!parse
          #   # @return [Array(Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource)]
          #   def self.variants; end
        end
      end
    end

    BetaBase64PDFBlock = Beta::BetaBase64PDFBlock
  end
end
