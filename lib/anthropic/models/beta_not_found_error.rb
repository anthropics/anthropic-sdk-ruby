# frozen_string_literal: true

module Anthropic
  module Models
    class BetaNotFoundError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #   A human-readable explanation of the error. Its wording can change, so don't
      #   match on it.
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #   The broad category of the error.
      #
      #   @return [Symbol, :not_found_error]
      required :type, const: :not_found_error

      # @!method initialize(message:, type: :not_found_error)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BetaNotFoundError} for more details.
      #
      #   @param message [String] A human-readable explanation of the error. Its wording can change, so don't matc
      #
      #   @param type [Symbol, :not_found_error] The broad category of the error.
    end
  end
end
