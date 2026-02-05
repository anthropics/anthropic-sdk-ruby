# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingConfigAdaptive < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :adaptive]
      required :type, const: :adaptive

      # @!method initialize(type: :adaptive)
      #   @param type [Symbol, :adaptive]
    end
  end
end
