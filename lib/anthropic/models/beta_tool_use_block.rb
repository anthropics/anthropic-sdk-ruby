# frozen_string_literal: true

module Anthropic
  module Models
    class BetaToolUseBlock < BaseModel
      # @!attribute [rw] id
      #   @return [String]
      required :id, String

      # @!attribute [rw] input
      #   @return [Object]
      required :input, Anthropic::Unknown

      # @!attribute [rw] name_
      #   @return [String]
      required :name_, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaToolUseBlock::Type]
      required :type, enum: -> { Anthropic::Models::BetaToolUseBlock::Type }

      class Type < Anthropic::Enum
        TOOL_USE = :tool_use
      end
    end
  end
end
