# frozen_string_literal: true

module Anthropic
  module Models
    class CacheMissUnavailable < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :unavailable]
      required :type, const: :unavailable

      # @!method initialize(type: :unavailable)
      #   @param type [Symbol, :unavailable]
    end
  end
end
