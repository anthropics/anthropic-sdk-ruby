# frozen_string_literal: true

module Anthropic
  module Models
    class CacheControlEphemeral < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :ephemeral]
      required :type, const: :ephemeral

      # @!method initialize(type: :ephemeral)
      #   @param type [Symbol, :ephemeral]
    end
  end
end
