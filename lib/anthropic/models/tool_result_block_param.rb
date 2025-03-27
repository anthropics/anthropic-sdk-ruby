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
      #   @return [Symbol, :tool_result]
      required :type, const: :tool_result

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }, nil?: true

      # @!attribute [r] content
      #
      #   @return [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>, nil]
      optional :content, union: -> { Anthropic::Models::ToolResultBlockParam::Content }

      # @!parse
      #   # @return [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>]
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
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   # @param content [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>]
      #   # @param is_error [Boolean]
      #   # @param type [Symbol, :tool_result]
      #   #
      #   def initialize(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      module Content
        extend Anthropic::Union

        variant String

        variant -> { Anthropic::Models::ToolResultBlockParam::Content::ContentArray }

        module Content
          extend Anthropic::Union

          discriminator :type

          variant :text, -> { Anthropic::Models::TextBlockParam }

          variant :image, -> { Anthropic::Models::ImageBlockParam }

          # @!parse
          #   # @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]
          #   def self.variants; end
        end

        # @!parse
        #   # @return [Array(String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>)]
        #   def self.variants; end

        ContentArray =
          Anthropic::ArrayOf[union: -> { Anthropic::Models::ToolResultBlockParam::Content::Content }]
      end
    end
  end
end
