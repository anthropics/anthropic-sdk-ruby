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

      # @!parse
      #   # Create a new instance of ToolResultBlockParam from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :tool_use_id
      #   #   @option data [String] :type
      #   #   @option data [Array<Object>, String, nil] :content
      #   #   @option data [Hash, nil] :is_error
      #   def initialize(data = {}) = super
    end
  end
end
