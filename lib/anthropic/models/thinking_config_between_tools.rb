# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingConfigBetweenTools < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :between_tools]
      required :type, const: :between_tools

      # @!method initialize(type: :between_tools)
      #   @param type [Symbol, :between_tools]
    end
  end
end
