# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRateLimitError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #   A human-readable explanation of the error. Its wording can change, so don't
      #   match on it.
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #   The broad category of the error.
      #
      #   @return [Symbol, :rate_limit_error]
      required :type, const: :rate_limit_error

      # @!method initialize(message:, type: :rate_limit_error)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BetaRateLimitError} for more details.
      #
      #   @param message [String] A human-readable explanation of the error. Its wording can change, so don't matc
      #
      #   @param type [Symbol, :rate_limit_error] The broad category of the error.
    end
  end
end
