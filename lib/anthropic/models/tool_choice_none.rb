# frozen_string_literal: true

module Anthropic
  module Models
    class ToolChoiceNone < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :none]
      required :type, const: :none

      # @!method initialize(type: :none)
      #   The model will not be allowed to use tools.
      #
      #   @param type [Symbol, :none]
    end
  end
end
