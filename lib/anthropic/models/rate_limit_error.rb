# frozen_string_literal: true

module Anthropic
  module Models
    class RateLimitError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :rate_limit_error]
      required :type, const: :rate_limit_error

      # @!method initialize(message:, type: :rate_limit_error)
      #   @param message [String]
      #   @param type [Symbol, :rate_limit_error]
    end
  end
end
