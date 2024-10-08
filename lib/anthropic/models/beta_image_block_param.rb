# frozen_string_literal: true

module Anthropic
  module Models
    class BetaImageBlockParam < BaseModel
      # @!attribute [rw] source
      #   @return [Anthropic::Models::BetaImageBlockParam::Source]
      required :source, -> { Anthropic::Models::BetaImageBlockParam::Source }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaImageBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::BetaImageBlockParam::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::BetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::BetaCacheControlEphemeral }

      class Source < BaseModel
        # @!attribute [rw] data
        #   @return [String]
        required :data, String

        # @!attribute [rw] media_type
        #   @return [Symbol, Anthropic::Models::BetaImageBlockParam::Source::MediaType]
        required :media_type, enum: -> { Anthropic::Models::BetaImageBlockParam::Source::MediaType }

        # @!attribute [rw] type
        #   @return [Symbol, Anthropic::Models::BetaImageBlockParam::Source::Type]
        required :type, enum: -> { Anthropic::Models::BetaImageBlockParam::Source::Type }

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
