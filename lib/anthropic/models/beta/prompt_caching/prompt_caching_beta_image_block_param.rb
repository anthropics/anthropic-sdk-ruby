# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaImageBlockParam < Anthropic::BaseModel
          # @!attribute source
          #
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source]
          required :source,
                   -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source
                   }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Type]
          required :type,
                   enum: -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Type }

          # @!attribute cache_control
          #
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral]
          optional :cache_control,
                   -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral }

          # @!parse
          #   # @param source [Object]
          #   # @param type [String]
          #   # @param cache_control [Object, nil]
          #   #
          #   def initialize(source:, type:, cache_control: nil) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          class Source < Anthropic::BaseModel
            # @!attribute data
            #
            #   @return [String]
            required :data, String

            # @!attribute media_type
            #
            #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source::MediaType]
            required :media_type,
                     enum: -> {
                       Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source::MediaType
                     }

            # @!attribute type
            #
            #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source::Type]
            required :type,
                     enum: -> {
                       Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam::Source::Type
                     }

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

      PromptCachingBetaImageBlockParam = PromptCaching::PromptCachingBetaImageBlockParam
    end
  end
end
