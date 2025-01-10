# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # tool_result_block_param => {
    #   tool_use_id: String,
    #   type: enum: Anthropic::Models::ToolResultBlockParam::Type,
    #   cache_control: Anthropic::Models::CacheControlEphemeral,
    #   content: union: Anthropic::Models::ToolResultBlockParam::Content,
    #   is_error: Anthropic::BooleanModel
    # }
    # ```
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
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
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
      #   # @param content [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>]
      #   # @param is_error [Boolean]
      #   #
      #   def initialize(tool_use_id:, type:, cache_control: nil, content: nil, is_error: nil, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case type
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
      # case content
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

        variant Anthropic::Models::ToolResultBlockParam::Content::ContentArray

        # @example
        #
        # ```ruby
        # case content
        # in {type: "text", text: String, type: enum: Anthropic::Models::TextBlockParam::Type, cache_control: Anthropic::Models::CacheControlEphemeral}
        #   # Anthropic::Models::TextBlockParam ...
        # in {type: "image", source: Anthropic::Models::ImageBlockParam::Source, type: enum: Anthropic::Models::ImageBlockParam::Type, cache_control: Anthropic::Models::CacheControlEphemeral}
        #   # Anthropic::Models::ImageBlockParam ...
        # end
        # ```
        #
        # @example
        #
        # ```ruby
        # case content
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
    end
  end
end
