# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_image_block_param => {
      #   source: Anthropic::Models::Beta::BetaImageBlockParam::Source,
      #   type: :image,
      #   cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral
      # }
      # ```
      class BetaImageBlockParam < Anthropic::BaseModel
        # @!attribute source
        #
        #   @return [Anthropic::Models::Beta::BetaImageBlockParam::Source]
        required :source, -> { Anthropic::Models::Beta::BetaImageBlockParam::Source }

        # @!attribute type
        #
        #   @return [Symbol, :image]
        required :type, const: :image

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!parse
        #   # @param source [Anthropic::Models::Beta::BetaImageBlockParam::Source]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param type [String]
        #   #
        #   def initialize(source:, cache_control: nil, type: :image, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # source => {
        #   data: String,
        #   media_type: Anthropic::Models::Beta::BetaImageBlockParam::Source::MediaType,
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
          #   @return [Symbol, Anthropic::Models::Beta::BetaImageBlockParam::Source::MediaType]
          required :media_type, enum: -> { Anthropic::Models::Beta::BetaImageBlockParam::Source::MediaType }

          # @!attribute type
          #
          #   @return [Symbol, :base64]
          required :type, const: :base64

          # @!parse
          #   # @param data [String]
          #   # @param media_type [String]
          #   # @param type [String]
          #   #
          #   def initialize(data:, media_type:, type: :base64, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

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
          end
        end
      end
    end

    BetaImageBlockParam = Beta::BetaImageBlockParam
  end
end
