# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaImageBlockParam < Anthropic::BaseModel
        # @!attribute source
        #   @return [Anthropic::Models::Beta::BetaImageBlockParam::Source]
        required :source, -> { Anthropic::Models::Beta::BetaImageBlockParam::Source }

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaImageBlockParam::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaImageBlockParam::Type }

        # @!attribute cache_control
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        class Source < Anthropic::BaseModel
          # @!attribute data
          #   @return [String]
          required :data, String

          # @!attribute media_type
          #   @return [Symbol, Anthropic::Models::Beta::BetaImageBlockParam::Source::MediaType]
          required :media_type, enum: -> { Anthropic::Models::Beta::BetaImageBlockParam::Source::MediaType }

          # @!attribute type
          #   @return [Symbol, Anthropic::Models::Beta::BetaImageBlockParam::Source::Type]
          required :type, enum: -> { Anthropic::Models::Beta::BetaImageBlockParam::Source::Type }

          class MediaType < Anthropic::Enum
            IMAGE_JPEG = :"image/jpeg"
            IMAGE_PNG = :"image/png"
            IMAGE_GIF = :"image/gif"
            IMAGE_WEBP = :"image/webp"
          end

          class Type < Anthropic::Enum
            BASE64 = :base64
          end

          # @!parse
          #   # Create a new instance of Source from a Hash of raw data.
          #   #
          #   # @param data [Hash{Symbol => Object}] .
          #   #   @option data [String] :data
          #   #   @option data [String] :media_type
          #   #   @option data [String] :type
          #   def initialize(data = {}) = super
        end

        class Type < Anthropic::Enum
          IMAGE = :image
        end

        # @!parse
        #   # Create a new instance of BetaImageBlockParam from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [Object] :source
        #   #   @option data [String] :type
        #   #   @option data [Object, nil] :cache_control
        #   def initialize(data = {}) = super
      end
    end

    BetaImageBlockParam = Beta::BetaImageBlockParam
  end
end
