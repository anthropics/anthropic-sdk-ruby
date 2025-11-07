# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #
        #   @return [Object]
        required :input, Anthropic::Internal::Type::Unknown

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, :tool_use]
        required :type, const: :tool_use

        response_only do
          # @api public
          #
          # Parsed input data coerced to the tool's input schema model.
          # Only present when tools are defined using the InputSchema DSL.
          required :parsed, Anthropic::Internal::Type::Unknown

          # @api private
          #
          # Internal buffer for accumulating partial JSON during streaming.
          # Used by streaming helpers to reconstruct complete JSON input from deltas.
          optional :_json_buf, String
        end

        # @!method initialize(id:, input:, name:, type: :tool_use)
        #   @param id [String]
        #   @param input [Object]
        #   @param name [String]
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaToolUseBlock = Beta::BetaToolUseBlock
  end
end
