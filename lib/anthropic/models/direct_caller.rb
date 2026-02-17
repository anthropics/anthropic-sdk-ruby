# frozen_string_literal: true

module Anthropic
  module Models
    class DirectCaller < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :direct]
      required :type, const: :direct

      # @!method initialize(type: :direct)
      #   Tool invocation directly from the model.
      #
      #   @param type [Symbol, :direct]
    end
  end
end
