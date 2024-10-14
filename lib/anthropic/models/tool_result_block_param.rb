# frozen_string_literal: true

module Anthropic
  module Models
    class ToolResultBlockParam < BaseModel
      # @!attribute [rw] tool_use_id
      #   @return [String]
      required :tool_use_id, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::ToolResultBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::ToolResultBlockParam::Type }

      # @!attribute [rw] content
      #   @return [Array<Anthropic::Models::ImageBlockParam, Anthropic::Models::TextBlockParam>, String]
      optional :content, Anthropic::Unknown

      # @!attribute [rw] is_error
      #   @return [Boolean]
      optional :is_error, Anthropic::BooleanModel

      class Type < Anthropic::Enum
        TOOL_RESULT = :tool_result
      end

      # Create a new instance of ToolResultBlockParam from a Hash of raw data.
      #
      # @overload initialize(tool_use_id: nil, type: nil, content: nil, is_error: nil)
      # @param tool_use_id [String]
      # @param type [String]
      # @param content [Array<Object>, String]
      # @param is_error [Hash]
      def initialize(data = {})
        super
      end
    end
  end
end
