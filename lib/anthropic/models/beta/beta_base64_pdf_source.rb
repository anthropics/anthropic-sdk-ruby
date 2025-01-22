# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_base64_pdf_source => {
      #   data: String,
      #   media_type: Anthropic::Models::Beta::BetaBase64PDFSource::MediaType,
      #   type: Anthropic::Models::Beta::BetaBase64PDFSource::Type
      # }
      # ```
      class BetaBase64PDFSource < Anthropic::BaseModel
        # @!attribute data
        #
        #   @return [String]
        required :data, String

        # @!attribute media_type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaBase64PDFSource::MediaType]
        required :media_type, enum: -> { Anthropic::Models::Beta::BetaBase64PDFSource::MediaType }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaBase64PDFSource::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaBase64PDFSource::Type }

        # @!parse
        #   # @param data [String]
        #   # @param media_type [String]
        #   # @param type [String]
        #   #
        #   def initialize(data:, media_type:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case media_type
        # in :"application/pdf"
        #   # ...
        # end
        # ```
        class MediaType < Anthropic::Enum
          APPLICATION_PDF = :"application/pdf"

          finalize!
        end

        # @example
        # ```ruby
        # case type
        # in :base64
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          BASE64 = :base64

          finalize!
        end
      end
    end

    BetaBase64PDFSource = Beta::BetaBase64PDFSource
  end
end
