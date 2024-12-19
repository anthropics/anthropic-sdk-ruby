# frozen_string_literal: true

module Anthropic
  module Models
    class Base64PDFSource < Anthropic::BaseModel
      # @!attribute data
      #
      #   @return [String]
      required :data, String

      # @!attribute media_type
      #
      #   @return [Symbol, Anthropic::Models::Base64PDFSource::MediaType]
      required :media_type, enum: -> { Anthropic::Models::Base64PDFSource::MediaType }

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::Base64PDFSource::Type]
      required :type, enum: -> { Anthropic::Models::Base64PDFSource::Type }

      # @!parse
      #   # @param data [String]
      #   # @param media_type [String]
      #   # @param type [String]
      #   #
      #   def initialize(data:, media_type:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case enum
      # in :"application/pdf"
      #   # ...
      # end
      # ```
      class MediaType < Anthropic::Enum
        APPLICATION_PDF = :"application/pdf"
      end

      # @example
      #
      # ```ruby
      # case enum
      # in :base64
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        BASE64 = :base64
      end
    end
  end
end
