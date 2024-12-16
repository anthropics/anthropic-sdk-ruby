# frozen_string_literal: true

module Anthropic
  module Models
    class ImageBlockParam < Anthropic::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Models::ImageBlockParam::Source]
      required :source, -> { Anthropic::Models::ImageBlockParam::Source }

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::ImageBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::ImageBlockParam::Type }

      # @!parse
      #   # @param source [Anthropic::Models::ImageBlockParam::Source]
      #   # @param type [String]
      #   #
      #   def initialize(source:, type:) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      class Source < Anthropic::BaseModel
        # @!attribute data
        #
        #   @return [String]
        required :data, String

        # @!attribute media_type
        #
        #   @return [Symbol, Anthropic::Models::ImageBlockParam::Source::MediaType]
        required :media_type, enum: -> { Anthropic::Models::ImageBlockParam::Source::MediaType }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::ImageBlockParam::Source::Type]
        required :type, enum: -> { Anthropic::Models::ImageBlockParam::Source::Type }

        # @!parse
        #   # @param data [String]
        #   # @param media_type [String]
        #   # @param type [String]
        #   #
        #   def initialize(data:, media_type:, type:) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        class MediaType < Anthropic::Enum
          IMAGE_JPEG = :"image/jpeg"
          IMAGE_PNG = :"image/png"
          IMAGE_GIF = :"image/gif"
          IMAGE_WEBP = :"image/webp"
        end

        class Type < Anthropic::Enum
          BASE64 = :base64
        end
      end

      class Type < Anthropic::Enum
        IMAGE = :image
      end
    end
  end
end
