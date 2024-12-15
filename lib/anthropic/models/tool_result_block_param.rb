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

      # @!attribute content
      #
      #   @return [Array<Anthropic::Models::ImageBlockParam, Anthropic::Models::TextBlockParam>, String]
      optional :content, Anthropic::Unknown

      # @!attribute is_error
      #
      #   @return [Boolean]
      optional :is_error, Anthropic::BooleanModel

      # @!parse
      #   # @param tool_use_id [String]
      #   # @param type [String]
      #   # @param content [Array<Object>, String, nil]
      #   # @param is_error [Boolean, nil]
      #   #
      #   def initialize(tool_use_id:, type:, content: nil, is_error: nil) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      class Type < Anthropic::Enum
        TOOL_RESULT = :tool_result
      end
    end
  end
end
