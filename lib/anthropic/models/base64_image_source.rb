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
      required :media_type, enum: -> { Anthropic::Models::Base64ImageSource::MediaType }

      # @!attribute type
      #
      #   @return [Symbol, :base64]
      required :type, const: :base64

      # @!parse
      #   # @param data [String]
      #   # @param media_type [Symbol, Anthropic::Models::Base64ImageSource::MediaType]
      #   # @param type [Symbol, :base64]
      #   #
      #   def initialize(data:, media_type:, type: :base64, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void

      # @see Anthropic::Models::Base64ImageSource#media_type
      module MediaType
        extend Anthropic::Internal::Type::Enum

        IMAGE_JPEG = :"image/jpeg"
        IMAGE_PNG = :"image/png"
        IMAGE_GIF = :"image/gif"
        IMAGE_WEBP = :"image/webp"

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
