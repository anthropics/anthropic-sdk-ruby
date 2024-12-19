# frozen_string_literal: true

module Anthropic
  module Models
    class ToolResultBlockParam < Anthropic::BaseModel
      # @!attribute tool_use_id
      #
      #   @return [String]
      required :tool_use_id, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::ToolResultBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::ToolResultBlockParam::Type }

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }

      # @!attribute content
      #
      #   @return [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>]
      optional :content, union: -> { Anthropic::Models::ToolResultBlockParam::Content }

      # @!attribute is_error
      #
      #   @return [Boolean]
      optional :is_error, Anthropic::BooleanModel

      # @!parse
      #   # @param tool_use_id [String]
      #   # @param type [String]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   # @param content [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>, nil]
      #   # @param is_error [Boolean, nil]
      #   #
      #   def initialize(tool_use_id:, type:, cache_control: nil, content: nil, is_error: nil, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case enum
      # in :tool_result
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        TOOL_RESULT = :tool_result
      end

      # @example
      #
      # ```ruby
      # case union
      # in String
      #   # ...
      # in Anthropic::Models::ToolResultBlockParam::Content::ContentArray
      #   # ...
      # end
      # ```
      class Content < Anthropic::Union
        ContentArray = Anthropic::ArrayOf[union: -> {
          Anthropic::Models::ToolResultBlockParam::Content::Content
        }]

        variant String

        variant -> { Anthropic::Models::ToolResultBlockParam::Content::ContentArray }

        # @example
        #
        # ```ruby
        # case union
        # in Anthropic::Models::TextBlockParam
        #   # ...
        # in Anthropic::Models::ImageBlockParam
        #   # ...
        # end
        # ```
        class Content < Anthropic::Union
          discriminator :type

          variant :text, -> { Anthropic::Models::TextBlockParam }

          variant :image, -> { Anthropic::Models::ImageBlockParam }
        end
      end

      # @example
      #
      # ```ruby
      # case union
      # in Anthropic::Models::TextBlockParam
      #   # ...
      # in Anthropic::Models::ImageBlockParam
      #   # ...
      # end
      # ```
      class Content < Anthropic::Union
        discriminator :type

        variant :text, -> { Anthropic::Models::TextBlockParam }

        variant :image, -> { Anthropic::Models::ImageBlockParam }
      end

      class TextBlockParam < Anthropic::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::TextBlockParam::Type]
        required :type, enum: -> { Anthropic::Models::TextBlockParam::Type }

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::CacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }

        # @!parse
        #   # @param text [String]
        #   # @param type [String]
        #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
        #   #
        #   def initialize(text:, type:, cache_control: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :text
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          TEXT = :text
        end
      end

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
end
