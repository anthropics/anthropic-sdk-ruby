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

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }

      # @!parse
      #   # @param source [Anthropic::Models::ImageBlockParam::Source]
      #   # @param type [String]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   #
      #   def initialize(source:, type:, cache_control: nil, **) = super

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
        #   def initialize(data:, media_type:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :"image/jpeg"
        #   # ...
        # in :"image/png"
        #   # ...
        # in :"image/gif"
        #   # ...
        # in :"image/webp"
        #   # ...
        # end
        # ```
        class MediaType < Anthropic::Enum
          IMAGE_JPEG = :"image/jpeg"
          IMAGE_PNG = :"image/png"
          IMAGE_GIF = :"image/gif"
          IMAGE_WEBP = :"image/webp"
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

      # @example
      #
      # ```ruby
      # case enum
      # in :image
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        IMAGE = :image
      end
    end
  end
end
