# frozen_string_literal: true

module Anthropic
  module Models
    class ToolReferenceBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute tool_name
      #
      #   @return [String]
      required :tool_name, String

      # @!attribute type
      #
      #   @return [Symbol, :tool_reference]
      required :type, const: :tool_reference

      # @!method initialize(tool_name:, type: :tool_reference)
      #   @param tool_name [String]
      #   @param type [Symbol, :tool_reference]
    end
  end
end
