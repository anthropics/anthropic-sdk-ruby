# frozen_string_literal: true

module Anthropic
  module Models
    class BillingError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :billing_error]
      required :type, const: :billing_error

      # @!parse
      #   # @param message [String]
      #   # @param type [Symbol, :billing_error]
      #   #
      #   def initialize(message:, type: :billing_error, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
