# frozen_string_literal: true

module Anthropic
  module Models
    class BillingError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #   A human-readable explanation of the error. Its wording can change, so don't
      #   match on it.
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #   The broad category of the error.
      #
      #   @return [Symbol, :billing_error]
      required :type, const: :billing_error

      # @!method initialize(message:, type: :billing_error)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BillingError} for more details.
      #
      #   @param message [String] A human-readable explanation of the error. Its wording can change, so don't matc
      #
      #   @param type [Symbol, :billing_error] The broad category of the error.
    end
  end
end
