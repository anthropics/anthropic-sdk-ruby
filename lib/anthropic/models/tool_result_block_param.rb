# frozen_string_literal: true

module Anthropic
  module Models
    class ToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute tool_use_id
      #
      #   @return [String]
      required :tool_use_id, String

      # @!attribute type
      #
      #   @return [Symbol, :tool_result]
      required :type, const: :tool_result

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute content
      #
      #   @return [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>, nil]
      optional :content, union: -> { Anthropic::ToolResultBlockParam::Content }

      # @!attribute is_error
      #
      #   @return [Boolean, nil]
      optional :is_error, Anthropic::Internal::Type::Boolean

      # @!method initialize(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result)
      #   @param tool_use_id [String]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param content [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>]
      #
      #   @param is_error [Boolean]
      #
      #   @param type [Symbol, :tool_result]

      # @see Anthropic::Models::ToolResultBlockParam#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant String

        variant -> { Anthropic::Models::ToolResultBlockParam::Content::ContentArray }

        module Content
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :text, -> { Anthropic::TextBlockParam }

          variant :image, -> { Anthropic::ImageBlockParam }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]
        end

        # @!method self.variants
        #   @return [Array(String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>)]

        # @type [Anthropic::Internal::Type::Converter]
        ContentArray =
          Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::ToolResultBlockParam::Content::Content }]
      end
    end
  end
end
