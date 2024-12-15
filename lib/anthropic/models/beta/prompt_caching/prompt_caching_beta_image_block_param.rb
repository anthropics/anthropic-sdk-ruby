# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaImageBlockParam < Anthropic::BaseModel
          # @!attribute source
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source]
          required :source,
                   -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source
                   }

          # @!attribute type
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Type]
          required :type,
                   enum: -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Type }

          # @!attribute cache_control
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral]
          optional :cache_control,
                   -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral }

          class Source < Anthropic::BaseModel
            # @!attribute data
            #   @return [String]
            required :data, String

            # @!attribute media_type
            #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source::MediaType]
            required :media_type,
                     enum: -> {
                       Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source::MediaType
                     }

            # @!attribute type
            #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source::Type]
            required :type,
                     enum: -> {
                       Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source::Type
                     }

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
          #   # Create a new instance of PromptCachingBetaImageBlockParam from a Hash of raw
          #   #   data.
          #   #
          #   # @param data [Hash{Symbol => Object}] .
          #   #   @option data [Object] :source
          #   #   @option data [String] :type
          #   #   @option data [Object, nil] :cache_control
          #   def initialize(data = {}) = super
        end
      end

      PromptCachingBetaImageBlockParam = PromptCaching::PromptCachingBetaImageBlockParam
    end
  end
end
