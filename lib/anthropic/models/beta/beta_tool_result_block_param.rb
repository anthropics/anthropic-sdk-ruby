# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolResultBlockParam < Anthropic::BaseModel
        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolResultBlockParam::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolResultBlockParam::Type }

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>]
        optional :content, union: -> { Anthropic::Models::Beta::BetaToolResultBlockParam::Content }

        # @!attribute is_error
        #
        #   @return [Boolean]
        optional :is_error, Anthropic::BooleanModel

        # @!parse
        #   # @param tool_use_id [String]
        #   # @param type [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>, nil]
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

          finalize!
        end

        # @example
        #
        # ```ruby
        # case union
        # in String
        #   # ...
        # in Anthropic::Models::Beta::BetaToolResultBlockParam::Content::ContentArray
        #   # ...
        # end
        # ```
        class Content < Anthropic::Union
          ContentArray = Anthropic::ArrayOf[union: -> {
            Anthropic::Models::Beta::BetaToolResultBlockParam::Content::Content
          }]

          variant String

          variant -> { Anthropic::Models::Beta::BetaToolResultBlockParam::Content::ContentArray }

          # @example
          #
          # ```ruby
          # case union
          # in Anthropic::Models::Beta::BetaTextBlockParam
          #   # ...
          # in Anthropic::Models::Beta::BetaImageBlockParam
          #   # ...
          # end
          # ```
          class Content < Anthropic::Union
            discriminator :type

            variant :text, -> { Anthropic::Models::Beta::BetaTextBlockParam }

            variant :image, -> { Anthropic::Models::Beta::BetaImageBlockParam }
          end
        end

        # @example
        #
        # ```ruby
        # case union
        # in Anthropic::Models::Beta::BetaTextBlockParam
        #   # ...
        # in Anthropic::Models::Beta::BetaImageBlockParam
        #   # ...
        # end
        # ```
        class Content < Anthropic::Union
          discriminator :type

          variant :text, -> { Anthropic::Models::Beta::BetaTextBlockParam }

          variant :image, -> { Anthropic::Models::Beta::BetaImageBlockParam }
        end

        class BetaTextBlockParam < Anthropic::BaseModel
          # @!attribute text
          #
          #   @return [String]
          required :text, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaTextBlockParam::Type]
          required :type, enum: -> { Anthropic::Models::Beta::BetaTextBlockParam::Type }

          # @!attribute cache_control
          #
          #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
          optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

          # @!parse
          #   # @param text [String]
          #   # @param type [String]
          #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
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

            finalize!
          end
        end

        class BetaImageBlockParam < Anthropic::BaseModel
          # @!attribute source
          #
          #   @return [Anthropic::Models::Beta::BetaImageBlockParam::Source]
          required :source, -> { Anthropic::Models::Beta::BetaImageBlockParam::Source }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaImageBlockParam::Type]
          required :type, enum: -> { Anthropic::Models::Beta::BetaImageBlockParam::Type }

          # @!attribute cache_control
          #
          #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
          optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

          # @!parse
          #   # @param source [Anthropic::Models::Beta::BetaImageBlockParam::Source]
          #   # @param type [String]
          #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
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
            #   @return [Symbol, Anthropic::Models::Beta::BetaImageBlockParam::Source::MediaType]
            required :media_type, enum: -> { Anthropic::Models::Beta::BetaImageBlockParam::Source::MediaType }

            # @!attribute type
            #
            #   @return [Symbol, Anthropic::Models::Beta::BetaImageBlockParam::Source::Type]
            required :type, enum: -> { Anthropic::Models::Beta::BetaImageBlockParam::Source::Type }

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

              finalize!
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

              finalize!
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

            finalize!
          end
        end
      end
    end

    BetaToolResultBlockParam = Beta::BetaToolResultBlockParam
  end
end
