# frozen_string_literal: true

module Anthropic
  module Models
    class BetaAPIErrorObject < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #   A human-readable explanation of the error. Its wording can change, so don't
      #   match on it.
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #   The broad category of the error.
      #
      #   @return [Symbol, :api_error]
      required :type, const: :api_error

      # @!method initialize(message:, type: :api_error)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BetaAPIErrorObject} for more details.
      #
      #   @param message [String] A human-readable explanation of the error. Its wording can change, so don't matc
      #
      #   @param type [Symbol, :api_error] The broad category of the error.
    end
  end
end
