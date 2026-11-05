# frozen_string_literal: true

module Anthropic
  module Models
    class BetaPermissionError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #   A human-readable explanation of the error. Its wording can change, so don't
      #   match on it.
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #   The broad category of the error.
      #
      #   @return [Symbol, :permission_error]
      required :type, const: :permission_error

      # @!method initialize(message:, type: :permission_error)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BetaPermissionError} for more details.
      #
      #   @param message [String] A human-readable explanation of the error. Its wording can change, so don't matc
      #
      #   @param type [Symbol, :permission_error] The broad category of the error.
    end
  end
end
