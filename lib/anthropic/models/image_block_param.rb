# frozen_string_literal: true

module Anthropic
  module Models
    class ImageBlockParam < BaseModel
      # @!attribute [rw] source
      #   @return [Anthropic::Models::ImageBlockParam::Source]
      required :source, -> { Anthropic::Models::ImageBlockParam::Source }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::ImageBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::ImageBlockParam::Type }

      class Source < BaseModel
        # @!attribute [rw] data
        #   @return [String]
        required :data, String

        # @!attribute [rw] media_type
        #   @return [Symbol, Anthropic::Models::ImageBlockParam::Source::MediaType]
        required :media_type, enum: -> { Anthropic::Models::ImageBlockParam::Source::MediaType }

        # @!attribute [rw] type
        #   @return [Symbol, Anthropic::Models::ImageBlockParam::Source::Type]
        required :type, enum: -> { Anthropic::Models::ImageBlockParam::Source::Type }

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
