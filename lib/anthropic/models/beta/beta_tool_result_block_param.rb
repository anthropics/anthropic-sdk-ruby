# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_tool_result_block_param => {
      #   tool_use_id: String,
      #   type: Anthropic::Models::Beta::BetaToolResultBlockParam::Type,
      #   cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral,
      #   content: Anthropic::Models::Beta::BetaToolResultBlockParam::Content,
      #   is_error: Anthropic::BooleanModel
      # }
      # ```
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
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute [r] content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>, nil]
        optional :content, union: -> { Anthropic::Models::Beta::BetaToolResultBlockParam::Content }

        # @!parse
        #   # @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>]
        #   attr_writer :content

        # @!attribute [r] is_error
        #
        #   @return [Boolean, nil]
        optional :is_error, Anthropic::BooleanModel

        # @!parse
        #   # @return [Boolean]
        #   attr_writer :is_error

        # @!parse
        #   # @param tool_use_id [String]
        #   # @param type [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>]
        #   # @param is_error [Boolean]
        #   #
        #   def initialize(tool_use_id:, type:, cache_control: nil, content: nil, is_error: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
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
        # ```ruby
        # case content
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

          variant Anthropic::Models::Beta::BetaToolResultBlockParam::Content::ContentArray

          # @example
          # ```ruby
          # case content
          # in {type: "text", text: String, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral}
          #   # Anthropic::Models::Beta::BetaTextBlockParam ...
          # in {type: "image", source: Anthropic::Models::Beta::BetaImageBlockParam::Source, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral}
          #   # Anthropic::Models::Beta::BetaImageBlockParam ...
          # end
          # ```
          #
          # @example
          # ```ruby
          # case content
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
      end
    end

    BetaToolResultBlockParam = Beta::BetaToolResultBlockParam
  end
end
