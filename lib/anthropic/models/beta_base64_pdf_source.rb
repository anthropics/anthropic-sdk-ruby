# frozen_string_literal: true

module Anthropic
  module Models
    class BetaBase64PDFSource < Anthropic::BaseModel
      # @!attribute [rw] data
      #   @return [String]
      required :data, String

      # @!attribute [rw] media_type
      #   @return [Symbol, Anthropic::Models::BetaBase64PDFSource::MediaType]
      required :media_type, enum: -> { Anthropic::Models::BetaBase64PDFSource::MediaType }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaBase64PDFSource::Type]
      required :type, enum: -> { Anthropic::Models::BetaBase64PDFSource::Type }

      class MediaType < Anthropic::Enum
        APPLICATION_PDF = :"application/pdf"
      end

      class Type < Anthropic::Enum
        BASE64 = :base64
      end

      # @!parse
      #   # Create a new instance of BetaBase64PDFSource from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :data
      #   #   @option data [String] :media_type
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
