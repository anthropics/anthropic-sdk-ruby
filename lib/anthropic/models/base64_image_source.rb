# frozen_string_literal: true

module Anthropic
  module Models
    class Base64ImageSource < Anthropic::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [String]
      required :data, String

      # @!attribute media_type
      #
      #   @return [Symbol, Anthropic::Models::Base64ImageSource::MediaType]
      required :media_type, enum: -> { Anthropic::Base64ImageSource::MediaType }

      # @!attribute type
      #
      #   @return [Symbol, :base64]
      required :type, const: :base64

      # @!method initialize(data:, media_type:, type: :base64)
      #   @param data [String]
      #   @param media_type [Symbol, Anthropic::Models::Base64ImageSource::MediaType]
      #   @param type [Symbol, :base64]

      # @see Anthropic::Models::Base64ImageSource#media_type
      module MediaType
        extend Anthropic::Internal::Type::Enum

        IMAGE_JPEG = :"image/jpeg"
        IMAGE_PNG = :"image/png"
        IMAGE_GIF = :"image/gif"
        IMAGE_WEBP = :"image/webp"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
