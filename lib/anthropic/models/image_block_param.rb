# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # image_block_param => {
    #   source: Anthropic::Models::ImageBlockParam::Source,
    #   type: :image,
    #   cache_control: Anthropic::Models::CacheControlEphemeral
    # }
    # ```
    class ImageBlockParam < Anthropic::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Models::ImageBlockParam::Source]
      required :source, -> { Anthropic::Models::ImageBlockParam::Source }

      # @!attribute type
      #
      #   @return [Symbol, :image]
      required :type, const: :image

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }, nil?: true

      # @!parse
      #   # @param source [Anthropic::Models::ImageBlockParam::Source]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   # @param type [Symbol, :image]
      #   #
      #   def initialize(source:, cache_control: nil, type: :image, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # source => {
      #   data: String,
      #   media_type: Anthropic::Models::ImageBlockParam::Source::MediaType,
      #   type: :base64
      # }
      # ```
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
        #   @return [Symbol, :base64]
        required :type, const: :base64

        # @!parse
        #   # @param data [String]
        #   # @param media_type [Symbol, Anthropic::Models::ImageBlockParam::Source::MediaType]
        #   # @param type [Symbol, :base64]
        #   #
        #   def initialize(data:, media_type:, type: :base64, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @abstract
        #
        # @example
        # ```ruby
        # case media_type
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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   #
          #   def self.values; end
        end
      end
    end
  end
end
