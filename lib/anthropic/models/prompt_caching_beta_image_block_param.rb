# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaImageBlockParam < BaseModel
      # @!attribute [rw] source
      #   @return [Anthropic::Models::PromptCachingBetaImageBlockParam::Source]
      required :source, -> { Anthropic::Models::PromptCachingBetaImageBlockParam::Source }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::PromptCachingBetaImageBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::PromptCachingBetaImageBlockParam::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::PromptCachingBetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::PromptCachingBetaCacheControlEphemeral }

      class Source < BaseModel
        # @!attribute [rw] data
        #   @return [String]
        required :data, String

        # @!attribute [rw] media_type
        #   @return [Symbol, Anthropic::Models::PromptCachingBetaImageBlockParam::Source::MediaType]
        required :media_type,
                 enum: lambda {
                   Anthropic::Models::PromptCachingBetaImageBlockParam::Source::MediaType
                 }

        # @!attribute [rw] type
        #   @return [Symbol, Anthropic::Models::PromptCachingBetaImageBlockParam::Source::Type]
        required :type, enum: -> { Anthropic::Models::PromptCachingBetaImageBlockParam::Source::Type }

        class MediaType < Anthropic::Enum
          IMAGE_JPEG = :"image/jpeg"
          IMAGE_PNG = :"image/png"
          IMAGE_GIF = :"image/gif"
          IMAGE_WEBP = :"image/webp"
        end

        class Type < Anthropic::Enum
          BASE64 = :base64
        end

        # Create a new instance of Source from a Hash of raw data.
        #
        # @overload initialize(data: nil, media_type: nil, type: nil)
        # @param data [String]
        # @param media_type [String]
        # @param type [String]
        def initialize(data = {})
          super
        end
      end

      class Type < Anthropic::Enum
        IMAGE = :image
      end

      # Create a new instance of PromptCachingBetaImageBlockParam from a Hash of raw
      #   data.
      #
      # @overload initialize(source: nil, type: nil, cache_control: nil)
      # @param source [Object]
      # @param type [String]
      # @param cache_control [Object]
      def initialize(data = {})
        super
      end
    end
  end
end
